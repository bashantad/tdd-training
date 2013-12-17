require 'spec_helper'

describe Order do
  context "Validations" do
    before do
      @valid_attr = {
        :customer => create(:customer),
        :order_date => "2012-12-23"
      }
    end
    it "should create an order with valid attributes" do
     Order.create(@valid_attr).should be_valid
    end
    
    [:customer, :order_date].each do |attr|
      it "must have valid #{attr}" do
        o = Order.create(@valid_attr.except(attr))
        o.errors.messages[attr].should_not be_blank 
      end 
    end
  end
   
  context "Associations" do
    it "should belongs to" do
      Order.new.should respond_to(:customer)
    end
  end
end
