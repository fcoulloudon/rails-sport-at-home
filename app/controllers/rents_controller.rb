class RentsController < ApplicationController
  
  #### PRELIMINARY ####
  def index
    @rents = Rent.where(user_id: userparams[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    if @user.type = "Owner"
      redirect_to rent_path
    else
      @equipment = Equipment.find(params[:equipment_id])
      #@owner = Equipment.find(params[:equipment_id]).user_id
      @rent = Rent.new # needed to instantiate the form_for
    end
  end

  def show
    # to add filter based on user_id.type
    @rents = Rent.find(params[:id])
  end

  def create
    @rent = Rent.new(list_params)
    if @rent.save
      redirect_to rent_path(@rent)
    else
      render :new
    end    
  end

  def destroy
    @rent = Rent.find(params[:id])
    @rent.destroy

    # no need for app/views/lists/destroy.html.erb
    redirect_to rents_path
  end

  private

  def list_params
    params.require(:rent).permit( :user_id, :equipment_id, :start_date, :end_date)
    # params.require(:name).require(:category).require(:address).permit(:phone_number)
  end

end
