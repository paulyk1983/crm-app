json.array! @inquiries.each do |inquiry|
  json.id inquiry.id
  json.first_name inquiry.first_name
end