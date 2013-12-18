class Customer < Person
  has_many :orders, :foreign_key => "customer_id"
  scope :loyal_customer_last_days, -> (term) {
     joins(:orders)
    .where("orders.created_at = ?",  "#{term}")
  }
end
