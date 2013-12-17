class OrderItems < ActiveRecord::Base
  validates :order, :item, :quantity, :presence => true
  belongs_to :order
  belongs_to :item
end
