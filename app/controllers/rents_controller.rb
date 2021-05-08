class RentsController < ApplicationController
  
  #### PRELIMINARY ####
  def index
    @equipments = Equipment.all
    if current_user.user_type === "User"
      @rents = Rent.where(user_id: current_user.id)
    else
      @rents = Rent.joins(:equipment).where(user_id: current_user.id)
      # raise
    end
  end

  def show
    @rent = Rent.find(params[:id])
    @equipment = Equipment.where(id: @rent.equipment_id)
  end

  def create
    @rent = Rent.new(list_params)
    @rent.user_id = current_user.id
    @rent.equipment_id = params[:equipment_id]
    @rent.start_date = Time.strptime(@rent.start_date.to_s, "%Y-%m-%d")
    @rent.end_date = Time.strptime(@rent.end_date.to_s, "%Y-%m-%d")
    if @rent.save
      redirect_to equipments_path
    else
      @equipment = Equipment.find(params[:equipment_id])
      render :new
    end 
  end

  def new
    # raise
      
    if current_user
      @rent = Rent.new
      @equipment = Equipment.find(params[:equipment_id])
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
   

    # @user = User.find(params[:user_id])
    # if @user.type = "Owner"
    #   redirect_to rent_path
    # else
    #  @equipment = Equipment.find(params[:equipment_id])
    #  #@owner = Equipment.find(params[:equipment_id]).user_id
    #  @rent = Rent.new # needed to instantiate the form_for
    # end
  end

  def destroy
    @rent = Rent.find(params[:id])
    @rent.destroy
    # no need for app/views/lists/destroy.html.erb
    redirect_to user_rents_path
  end

  private

  def list_params
    params.require(:rent).permit( :user_id, :equipment_id, :start_date, :end_date)
    # params.require(:name).require(:category).require(:address).permit(:phone_number)
  end

end
