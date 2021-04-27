class RentsController < ApplicationController
  
  #### PRELIMINARY ####
  def index
    @rents = Rent.all
  end

  def new
    @rent = Rent.new # needed to instantiate the form_for
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
    params.require(:rent).permit(:first_name, :last_name, :email, :phone, :type )
    # params.require(:name).require(:category).require(:address).permit(:phone_number)
  end

end
