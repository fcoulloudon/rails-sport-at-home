class UsersController < ApplicationController

  def new
    @user = User.new # needed to instantiate the form_for
  end

  def show
    # to add filter based on user_id.type
    @users = User.find(params[:id])
  end

  def create
    @user = User.new(list_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end    
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to equipments_path
  end

  private

  def list_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :type )
    # params.require(:name).require(:category).require(:address).permit(:phone_number)
  end

end
