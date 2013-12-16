require 'spec_helper'

describe Message do
  
  describe "Validations" do
    [:sender, :recipient, :subject].each do |attr|
      it "must have #{attr}" do
        m = Message.create
        m.should_not be_valid
        m.errors.messages[attr].should_not be_nil
      end
    end
  end
  
  describe "Associations" do 
    it "should belongs to sender" do
      Message.new.should respond_to(:sender)
    end
    
    it "should belongs to recipient" do
      Message.new.should respond_to(:recipient)
    end
    
    it  "can retrieve a sender and that is Person object" do
      msg = create(:message)
      msg.sender.should_not be_nil
      msg.sender.should be_kind_of(Person)
    end
  end
end
