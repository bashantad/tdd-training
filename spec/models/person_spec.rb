require 'spec_helper'

describe Person do
  before(:each) do
    @valid_attributes = {
      :first_name => "Joe",
      :last_name => "Doe"
    }
  end
  
  it "should change person's count by 1 when given valid attributes" do
    lambda{
      Person.create(@valid_attributes)
    }.should change(Person, :count).by(1)
  end
  
  it "saves the first_name" do
    p = Person.create(:first_name => "John")
    p.first_name.should == "John"
  end
  
  it "leaves last_name nil if not assigned" do
    p = Person.create
    p.last_name.should be_nil
  end
  
  it "verified that first_name is Joe" do
    p = Person.create(:first_name => "Joe")
    p.should be_joe
  end
  
  context "Validations" do
    [:first_name, :last_name].each do |attr|
      it "should not validates presence of #{attr}" do
        p = Person.create(attr => "")
        p.errors.messages[attr].should_not be_nil
      end
    end
  end
 
  it "can have optional middle name" do
    p = Person.create(@valid_attributes.merge(:middle_name => "Hello"))
    p.should be_valid
  end
  
  it "should not change person's count if first_name is not present" do
    lambda{
      Person.create(@valid_attributes.except(:first_name))
    }.should_not change(Person, :count)
  end
  
  it "should return full name given first and last name" do
    p = Person.create(@valid_attributes)
    p.full_name == "#{p.first_name} #{p.last_name}"
  end
  
  it "should return full name including middle name if it's present" do
    @attr = {:first_name => "Bash", :last_name => "Dahal", :middle_name => "None"}
    person = Person.create(@attr)
    person.full_name.should == "#{person.first_name} #{person.middle_name} #{person.last_name}"
  end
  
  it 'should make a person from factory' do
    p = FactoryGirl.create(:person)
    p.should_not be_nil
    p.should be_kind_of(Person)
  end
  
  it 'should find a people by partial name match' do
    jona = create(:person, :first_name => "Jona", :last_name => "Smith")
    peter = create(:person, :first_name => "Peter", :last_name => "Jones")
    sally = create(:person, :first_name => "Sally", :last_name => "Miller")
    Person.find_by_names_starting_with("Jon").should == [jona, peter]
  end
  
  describe "Associations" do
    it "should respond to messages" do
      Person.new.should respond_to(:messages)
    end
    
    it "should retrieve messages" do
      msg = create(:message)
      p = msg.recipient
      p.messages.should == [msg]
    end
  end
end
