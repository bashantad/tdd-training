require 'spec_helper'

describe Address do
  before do
    @valid_attr = {
      :street => "41 Stewart",
      :city => "Richmond",
      :zip => "3083",
      :person_id => 1
      
    }
  end
  context "Validations" do 
    it "should have a city" do 
      a = Address.new
      a.valid?.should be_false
      a.should_not be_valid
    end
    
    [:street, :city, :zip].each do |attr|
      it "should validate presence of #{attr}" do
        a = Address.create
        a.errors.messages[attr].should_not be_nil
      end
    end
  end
  
  describe "When country is missing" do
    it "should default to Australia" do
      a = Address.new(@valid_attr)
      a.country.should be_blank
      a.save
      a.country.should == "Australia"
    end
  end
end
