require 'spec_helper'

describe Item do
  context "Validations" do
    before do
      @valid_attr = {
        :name => "Bread",
        :price => 2.00,
        :description => "Nice ingredient to put in any kind of food"
      }
    end
    it "should create an item with valid attributes" do
      lambda{
        Item.create(@valid_attr)
      }.should change(Item, :count).by(1)
    end
    
    [:name, :price].each do |attr|
      it "must have #{attr}" do
        item = Item.create(@valid_attr.except(attr))
        item.errors.messages[attr].should_not be_blank
      end
    end
    
    it "shouldn't allow to create an item if price is not number" do
      item = Item.create(@valid_attr.merge(:price => "hello"))
      item.errors.messages[:price].should_not be_nil
    end
    
    it "should not allow to create item if price has more than 2 decimal places" do
      item = Item.create(@valid_attr.merge(:price => 2.345))
      item.should_not be_valid
    end
    
    it "should not allow to create item if price is negative number" do
      item = Item.create(@valid_attr.merge(:price => -23))
      item.errors.messages[:price].should_not be_blank
    end
    
    it "should create item with optional description" do
      item = Item.create(@valid_attr.except(:description))
      item.should be_valid
    end
  end  
end
