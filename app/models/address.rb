class Address < ActiveRecord::Base
  belongs_to :person
  validates :city, :zip, :street, :presence => true
  before_save :default_country
  
  private
  def default_country
    if self.country.blank?
      self.country = "Australia"
    end
  end
end
