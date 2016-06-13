json.array! @companies.each do |company|
  json.id company.id
  json.created_at company.created_at
  json.name company.name
  json.phone_number company.phone_number
  json.address company.address
  json.twitter_handle company.twitter_handle
  json.company_notes company.company_notes
end