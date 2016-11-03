class PlacesController < ApplicationController
    
    def index
     @places = Place.all
    end 
    def new
     @places = Place.new
    end
    def create
     @places = current_user.places.create(place_params)
        if @places.valid?
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
    end

  private

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end
   before_action :authenticate_user!, only: [:new, :create]
   
end
