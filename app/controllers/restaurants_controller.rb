class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    # lister les restaurants
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)      
    else
      render :new
    end
    redirect_if_success("/restaurants") if @restaurant.save
  end

  def edit
  end

  def update
    # also possible => Restaurant.where(id: params[:id]).first.update(restaurant_params)
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path 
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end
    def restaurant_params
      params.require(:restaurant).permit(:name, :rating)
    end

end
