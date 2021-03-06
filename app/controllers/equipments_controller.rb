class EquipmentsController < ApplicationController
  def new
    @equipment = Equipment.new
    @equipment.user = current_user
  end
  
  def index
    if params[:search].present?
      @equipments = Equipment.search_by_title_and_description(params[:search][:query])
      # @rent = Rent.new
    else
      # raise
      @equipments = Equipment.all
      # @rent = Rent.new
    end
  end

  def myequipments
    @equipments = current_user.equipments
    @rent = Rent.new
  end
  
  def create
    @equipment = Equipment.new(equipment_params)
    # raise
    @equipment.user = current_user
    if @equipment.save
      redirect_to equipment_path(@equipment)
    else
      render :new
    end
  end

  def show
    @equipment = Equipment.find(params[:id])
  end

  def edit
    @equipment = Equipment.find(params[:id])
  end

  # def edit
  #   @equipment = Equipment.find(params[:id])
  #   current_user.equipments.each do |equipment|
  #     equipmentmatchs = Equipment.where(id: params[:id])
  #     equipmentmatchs.each do |equipmentmatch|
  #       @matchs << Match.find(equipmentmatch.match.id)
  #     end
  #   end
  # end

  def destroy
    @equipment = Equipment.find(params[:id])
    @equipment.destroy
    redirect_to myequipments_path(id: current_user.id)
  end

  def update
    @equipment = Equipment.find(params[:id])
    @equipment.update(equipment_params)
    redirect_to equipment_path(@equipment)
  end

  private

  def equipment_params
    params.require(:equipment).permit(:title, :description, :daily_rate, :image)
  end
end