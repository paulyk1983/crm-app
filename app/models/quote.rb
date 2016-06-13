class Quote < ActiveRecord::Base
  belongs_to :user, :contact, :company, :inquiry, :product
end
