require 'csv'

class DashboardController < ApplicationController
  def show
    @file = CSV.read('test.csv')
    @file.each_with_index do |row, i|
      unless i == 0
        Inquiry.create(
          user_id: current_user.id,
          company: row[0],
          first_name: row[1],
          last_name: row[2],
          email: row[3],
          phone_number: row[4],
          created_at: row[5]
        )
      end
    end
  end
end