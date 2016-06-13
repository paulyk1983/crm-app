class Quote < ActiveRecord::Base
  belongs_to :user
  belongs_to :contact
  belongs_to :company
  belongs_to :inquiry
  belongs_to :product
end
