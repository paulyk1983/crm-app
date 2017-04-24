json.array! @quotes.each do |quote|
  json.product_id quote.product_id
  json.contact_id quote.contact_id
  json.created_at quote.created_at
end