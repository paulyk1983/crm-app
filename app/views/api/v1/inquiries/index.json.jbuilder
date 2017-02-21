json.array! @inquiries.each do |inquiry|
  json.id inquiry.id
  json.company_id inquiry.company_id
  json.created_at inquiry.created_at
  json.first_name inquiry.first_name
  json.last_name inquiry.last_name
  json.email inquiry.email
  json.phone_number inquiry.phone_number
end