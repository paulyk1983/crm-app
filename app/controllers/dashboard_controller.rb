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
          ribbon_type: row[24],
          quantity: row[26],
          status: row[27],
          new_lead: row[28],
          source: row[30],
          width: row[31],
          in_hand_date: row[32],
          lead_time: row[33],
          lead_number: row[34],
          metal_end_type: row[37],
          bow_loop_type: row[38],
          bow_size: row[40],
          registered: row[46],
          subscribed: row[47]          
        )
      end
    end
  end
end