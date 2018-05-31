require "http";

class YelpController < ApplicationController

   API_KEY = "WTknuy37fu844_0llVQVc7-snemAtXe7Uthm7T80_ypKXzvn9mw8BeB2fJP36lbrCBtf63wXmajcUEAxXLMH-Qx1lTb7-HChVCQhFiABlcNU66VeRYV_zR66UA4PW3Yx"

   # Constants, do not change these
   API_HOST = "https://api.yelp.com"
   SEARCH_PATH = "/v3/businesses/search"
   BUSINESS_PATH = "/v3/businesses/"
   SEARCH_LIMIT = 5

   def get_next_course

     filter = input_params

     type= params[:filter][:type]
     location= params[:filter][:location]

    #  actual yelp API call
     response = search(type,location)

     puts "Found #{response["total"]} businesses. Listing #{SEARCH_LIMIT}:"
     # response["businesses"].each {|biz| puts biz["name"]}

     render json: response

   end

   def search(type,location)

     url = "#{API_HOST}#{SEARCH_PATH}"
     yelpParams = {
       term: type,
       location: location,
       limit: SEARCH_LIMIT
     }

     response = HTTP.auth("Bearer #{API_KEY}").get(url, params: yelpParams)

     response.parse
   end

   private
   def input_params
     params.require(:filter).permit(:type,:location)
   end

end
