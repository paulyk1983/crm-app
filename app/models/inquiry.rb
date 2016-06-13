class Inquiry < ActiveRecord::Base
  belongs_to :user, :contact, :company
  has_many :quotes, :samples
end
