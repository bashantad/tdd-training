require 'spec_helper'

describe Customer do
   before do
     @order1 = create(:order)
     @customer1 = @order1.customer
     @order2 = create(:order, :created_at => 20.days.ago)
     @customer2 = @order2.customer
     @item1 = create(:item)
     @item2 = create(:item)
     @order1.order_items.create(:item => @item1)
     @order2.order_items.create(:item => @item2)
   end
   
   xit "finds customers who placed orders in the last 20 days" do
     Customer.loyal_customer_last_days(25.days.ago).should == [@customer2]
   end
end

