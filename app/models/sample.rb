class Sample < ActiveRecord::Base
  belongs_to :user
  belongs_to :contact
  belongs_to :company
  belongs_to :inquiry
  belongs_to :quote
  belongs_to :product
end
