class ProfilesController < ApplicationController
  def index
  end

  def show
    @profile = current_user.profile
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
  end

  def new
    @user = current_user
    @profile = Profile.new
    @user.profile = current_user.profile
  end

  def create
    @user = current_user
    @profile = Profile.new
    @user.profile = current_user.profile

    if @user.profile.save
      redirect_to homes_index_path
    else
      render :new
    end
  end

  private 

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :year, :major, :activities_and_clubs, :looking_for_place, :open_to_roommates, :price_range)
  end
end
