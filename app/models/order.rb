class Order < ActiveRecord::Base
  validates :order_date, :customer, :customer, :presence => true
  belongs_to :customer
  has_many :items, :through =>  :order_items 
end
