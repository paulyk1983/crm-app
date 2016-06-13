class Company < ActiveRecord::Base
  belongs_to :user
  has_many :contacts
  has_many :quotes
  has_many :samples
end
