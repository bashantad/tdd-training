require 'spec_helper'

describe OrderItem do
  context "Validations" do
    before do
      @valid_attr = {
        :order => create(:order),
        :item => create(:item),
        :quantity => 2
      }
    end
    [:order, :item, :quantity].each do |attr| 
      it "must have valid #{attr}" do
        oi = OrderItem.create(@valid_attr.except(attr))
        oi.errors.messages[attr].should_not be_nil
      end
    end
  end

  context "Associations" do
    it "should belongs to items" do
      OrderItem.new.should respond_to(:item)
    end

    it "should belongs to order" do
      OrderItem.new.should respond_to(:order)
    end
  end
end
