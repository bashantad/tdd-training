class Item < ActiveRecord::Base
   validates :name, :price, :presence => true
   validates :price, :format => { :with => /\A\d+??(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0}
   has_many :orders, :through => :order_items
end
