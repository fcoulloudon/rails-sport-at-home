class EquipmentsController < ApplicationController
  def new
    @equipment = Equipment.new
  end
  
  def index
    @equipments = Equipment.all
    @rent = Rent.new
  end
  
  def create
    @equipment = Equipment.new(params_equipment)
    @equipment.user = current_user
    if @equipment.save
      redirect_to equipment_path(@equipment)
    else
      render :new
    end
  end

  def show
    @equipment = Equipment.find(params[:equipment_id])
  end

  def edit
    @equipment = Equipment.find(params[:id])
          @matchs = []
      @match = nil
      current_user.equipments.each do |equipment|
        equipmentmatchs = EquipmentMatch.where(equipment_id: equipment.id)
        equipmentmatchs.each do |equipmentmatch|
          @matchs << Match.find(equipmentmatch.match.id)
        end
      end
  end

  def destroy
    @equipment = Equipment.find(params[:id])
    @rents = @equipment.rents
    @equipment.destroy
    redirect_to rents_path(@rents)
  end

  def update
    @equipment = Equipment.find(params[:id])
    @equipment.update(params_equipment)
    redirect_to flat_path(@equipment)
  end

  private

  def equipment_params
    params.require(:equipment).permit(:name, :image_url)
  end
end