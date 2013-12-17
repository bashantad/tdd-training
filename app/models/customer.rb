class Customer < Person
  has_many :orders, :foreign_key => "customer_id"
end
