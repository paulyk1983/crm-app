class Contact < ActiveRecord::Base
  belongs_to :user
  belongs_to :company
  has_many :quotes
  has_many :samples
  has_many :products
  has_many :inquiries

  validates :first_name, presence: true
  validates :email, presence: true
  validates :company_name, presence: true
end
