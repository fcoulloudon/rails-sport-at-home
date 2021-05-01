class EquipmentsController < ApplicationController
    def index
      @equipments  = Equipment.all
    end

    def def show
    
    end
  
    def create
      @rents = Rent.find(params[:rent_id])
      @equipment = Equipment.new(equipment_params)
      @equipment.rents = @rents
      if @equipment.save
        redirect_to rents_path(@rents)
      else
        render 'equipments/show'
      end
    end
  
    def destroy
      @equipment = Equipment.find(params[:id])
      @rents = @equipment.rents
      @equipment.destroy
      redirect_to rents_path(@rents)
    end
  
    private
  
    def equipment_params
      params.require(:equipment).permit(:name, :image_url)
    end
  end