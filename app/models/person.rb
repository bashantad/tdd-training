class Person < ActiveRecord::Base
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  def joe?
    first_name == "Joe"
  end
end
