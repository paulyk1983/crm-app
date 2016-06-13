class Contact < ActiveRecord::Base
  belongs_to :user, :company
  has_many :quotes, :samples, :products, :inquiries
end
