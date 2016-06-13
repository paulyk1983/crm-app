json.array! @companies.each do |company|
  json.id company.id
  json.created_at company.created_at
  json.twitter_handle company.twitter_handle
  json.phone_number company.phone_number
  json.address company.address
  json.company_notes company.company_notes
end