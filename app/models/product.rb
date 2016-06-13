class Product < ActiveRecord::Base
  belongs_to :user
  has_many :quotes, :samples
end
