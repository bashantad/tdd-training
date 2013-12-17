FactoryGirl.define do
  factory :person do |p|
    p.first_name "John"
    p.last_name "Doe"
  end
  
  factory :message do |m|
    m.association :sender, :factory => :person
    m.association :recipient, :factory => :person
    m.subject "Message to send message"
  end
  
  factory :item do |i|
    i.name "pineapple"
    i.price 4.34
    i.description "Can be used anywhere"
  end
  
  factory :customer do |c|
    c.first_name "Daniel"
    c.last_name "Todd"
  end
  
  factory :order do |o|
    o.association :customer, :factory => :customer
    o.order_date "2013-12-10"
  end
  
  factory :order_items do |oi|
    oi.association :order, :factory => :order
    oi.association :item, :factory => :item
    oi.quantity 4
  end
end