class Inquiry < ActiveRecord::Base
  belongs_to :user
  belongs_to :contact
  belongs_to :company
  has_many :quotes
  has_many :samples
end
