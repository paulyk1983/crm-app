class Company < ActiveRecord::Base
  belongs_to :user
  has_many :contacts, :quotes, :samples, :products
end
