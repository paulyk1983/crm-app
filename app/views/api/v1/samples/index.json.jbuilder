json.array! @samples.each do |sample|
  json.id sample.id
  json.user_id sample.user_id
  json.contact_id sample.contact_id
  json.company_id sample.company_id
  json.inquiry_id sample.inquiry_id
  json.quote_id sample.quote_id
  json.product_id sample.product_id
  json.name sample.name
  json.status sample.status
  json.note_to_receiver sample.note_to_receiver
  json.note_to_sales sample.note_to_sales
  json.price sample.price
  json.lead_time sample.lead_time
  json.street sample.street
  json.suite sample.suite
  json.city sample.city
  json.state sample.state
  json.zip_code sample.zip_code
  json.shipping_method sample.shipping_method
  json.drop_ship sample.drop_ship
  json.custom_color sample.custom_color
  json.custom_length sample.custom_length
  json.custom_width sample.custom_width
  json.custom_other sample.custom_other
  json.created_at sample.created_at
end