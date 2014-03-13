class ProfileController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end

  def edit
  end

  def update
  end

  def new
    @user = User.find(params[:user_id])
    @profile = @user.profile.new
  end

  def create
    @user = User.find(params[:user_id])
    @profile = @user.profile.new(profile_params)
  end

  private 

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :year, :major, :activities_and_clubs, :looking_for_place, :open_to_roommates, :price_range, :user_id)
  end
end
