require "http";

class YelpController < ApplicationController

   API_KEY = "WTknuy37fu844_0llVQVc7-snemAtXe7Uthm7T80_ypKXzvn9mw8BeB2fJP36lbrCBtf63wXmajcUEAxXLMH-Qx1lTb7-HChVCQhFiABlcNU66VeRYV_zR66UA4PW3Yx"

   # Constants, do not change these
   API_HOST = "https://api.yelp.com"
   SEARCH_PATH = "/v3/businesses/search"
   BUSINESS_PATH = "/v3/businesses/"
   SEARCH_LIMIT = 10

   def get_next_course

     filter = input_params

     userId = params[:filter][:userId]

     type = params[:filter][:preference]
     location = params[:filter][:location]
     price = params[:filter][:price_range]

     groupName= params[:filter][:group_name]
     friendName= params[:filter][:friend_name]

     #  actual yelp API call
     response = search

     # puts "Found #{response["total"]} businesses. Listing #{SEARCH_LIMIT}:"
     # response["businesses"].each {|biz| puts biz["name"]}

     winNumber = rand(response["businesses"].length) - 1

     winning_restaurant = response["businesses"][winNumber]

     winningRestaurant = winning_restaurant["name"]
     winningUrl = winning_restaurant["url"]

     user = User.find(userId  )

     outingParams = { "winner": friendName,
                      "winning_restaurant": winningRestaurant,
                      "winning_group": groupName,
                      "url": winningUrl}

     # outingParams.permit(:winner,:winning_restaurant,:winning_group,:url)

     outing = Outing.new(outingParams)

     user.outings << outing

     render json: response["businesses"][winNumber]

   end

   def search

     url = "#{API_HOST}#{SEARCH_PATH}"
     yelpParams = {
       term: params[:filter][:preference],
       location: params[:filter][:location],
       price: params[:filter][:price_range],
       open_now: true,
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
