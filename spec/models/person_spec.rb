require 'spec_helper'

describe Person do
  before(:each) do
    @valid_attributes = {
      :first_name => "Joe",
      :last_name => "Doe"
    }
  end
  
  it "should create a new instance given valid attributes" do
    lambda {
      Person.create!(@valid_attributes)
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
  
  it "must have first_name" do
    p = Person.create(:first_name => "")
    p.should_not be_valid
  end
  
  it "must have last_name" do 
    p = Person.create(:last_name => "")
    p.should_not be_valid
  end
  
  context "Validations" do
    [:first_name, :last_name].each do |attr|
      it "should not validates presence of #{attr}" do
        p = Person.create(attr => "")
        p.errors.messages[attr].should_not be_nil
      end
    end
  end
  
end
