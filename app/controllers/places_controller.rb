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
    def show
     @place = Place.find(params[:id])
    end
    def edit
     @place = Place.find(params[:id])
    end
    def update
     @place = Place.find(params[:id])
     @place.update_attributes(place_params)
     redirect_to root_path
    end
    def destroy
     @place = Place.find(params[:id])
     @place.destroy
     redirect_to root_path
    end
    @comment = Comment.new
    private
    def place_params
     params.require(:place).permit(:name, :description, :address)
    end
    before_action :authenticate_user!, only: [:new, :create]
    
   
   
end
