class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show edit update destroy]

  def index
    @total = Flat.count
    if params[:query].nil?
      @flats = Flat.all
    else
      @query = params[:query]
      @flats = Flat.where("name LIKE '%#{params[:query]}%'")
    end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.create(flat_params)
    redirect_to flats_path

    # @restaurant = Restaurant.new(restaurant_params)
    # if @restaurant.save
    #   @restaurant.save
    #   redirect_to restaurant_path(@restaurant)
    # else
    #   render :new
    # end
  end

  def update
    @flat.update(flat_params)
    redirect_to flats_path
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end
end
