class Api::V1::RestaurantPicksController < Api::V1::BaseController
  skip_before_action :verify_request

  def create
    restaurants = set_restaurants
    restaurants.each do |restaurant|
      @restaurant_pick = RestaurantPick.create(
        user: User.find(params[:user_id]),
        event: Event.find(params[:event_id]),
        event_restaurant: EventRestaurant.find(restaurant)
      )
    end
    render json: { restaurant_pick: @restaurant_pick }
  end

  private

  def set_restaurants
    @restaurants = params[:restaurants]
  end
end
