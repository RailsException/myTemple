class Donar < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :country, :createdBy, :dob, :emailid, :fname, :lname, :mobile, :phone, :state, :updatedBy, :zip

  validates :fname, :lname, :email, presence: true
  validates :email , uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
end
