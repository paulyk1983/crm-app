json.array! @products.each do |product|
  json.short_description product.short_description
  json.sku product.sku
  json.created_at product.created_at
  json.description product.description
  json.category product.category
  json.vendor product.vendor
  json.cost product.cost
  json.cost product.unit_price
  json.cost product.qty_in_stock
end