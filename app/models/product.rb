class Product < ActiveRecord::Base
  belongs_to :user
  has_many :quotes
  has_many :samples
end
