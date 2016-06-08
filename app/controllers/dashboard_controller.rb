require 'csv'

class DashboardController < ApplicationController
  def show
    @file = CSV.read('inquiries.csv')
    @file.each_with_index do |row, i|
      unless i == 0
        Inquiry.create(
          user_id: current_user.id,
          company: row[3],
          first_name: row[4],
          last_name: row[5],
          email: row[6],
          phone_number: row[7],
          created_time: Time.strptime(row[8], "%m/%d/%y %H:%M").to_time,          
          zip_code: row[13],
          comment: row[15],
          color: row[18],
          product: row[19],
          material: row[20],
          length: row[22],
          application: row[23],
          
        )
      end
    end
  end
end