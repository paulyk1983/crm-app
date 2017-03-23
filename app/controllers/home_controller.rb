require 'unirest'

class HomeController < ApplicationController
  def show
    # MAKE GET REQUEST TO LEMONSTAND API 
    response = Unirest.get(
      "https://finishlinecorp.com/api/v2/products",
      headers: {
        "Authorization" => ENV["LEMONSTAND_API_KEY"], 
        "Content-Type" => "application/json"
      }
    )
    @test = response.body

    if current_user
      redirect_to '/dashboard'
    end
  end

  def testpost
    # MAKE POST REQUEST TO LEMONSTAND TO MAKE A PROUDCT  
    response = Unirest.post(
      "https://finishlinecorp.com/api/v2/product",
      headers: {
        "Authorization" => ENV["LEMONSTAND_API_KEY"], 
        "Content-Type" => "application/json"
      },
      parameters: {
        'name' => 'test-product',
        'sku' => 'test-sku123',
        'base_price' => '10',
        'url_name' => 'test-product-url'
      }
    )
    flash[:success] = "Status: #{response.code}, Headers: #{response.headers}, Body: #{response.raw_body}"
    redirect_to '/'
  end
end