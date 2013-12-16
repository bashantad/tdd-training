class Person < ActiveRecord::Base
  validates :first_name, :last_name, :presence => true
  scope :find_by_names_starting_with, -> (term) { where("first_name LIKE ? OR last_name LIKE ?",  "#{term}%", "#{term}%" )}
  has_many :addresses
  has_many :messages, :foreign_key => "recipient_id"
  def joe?
    first_name == "Joe"
  end
  
  def full_name
    if middle_name.present?
      "#{first_name} #{middle_name} #{last_name}"
    else
      "#{first_name} #{last_name}"
    end
  end
end
