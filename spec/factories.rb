FactoryGirl.define do
  factory :person do |p|
    p.sequence(:first_name) {|n| "John#{n}"}
    p.sequence(:last_name) {|n| "Doe#{n}" }
  end
  
  factory :message do |m|
    m.association :sender, :factory => :person
    m.association :recipient, :factory => :person
    m.subject "Message to send message"
  end
  
  factory :item do |i|
    i.sequence(:name) {|n| "pineapple#{n}"} 
    i.sequence(:price) {|n| 4.34 + n }
    i.sequence(:description){|n| "Can be used anywhere#{n}"}
  end
  
  factory :customer do |c|
    c.first_name "Daniel"
    c.last_name "Todd"
  end
  
  factory :order do |o|
    o.association :customer, :factory => :customer
    o.order_date "2013-12-10"
  end
  
  factory :order_item do |oi|
    oi.association :order, :factory => :order
    oi.association :item, :factory => :item
    oi.quantity 4
  end
  factory :user do |u|
     u.email 'test@gmail.com'
     u.password 'test1234'
     u.password_confirmation 'test1234'
   end
end