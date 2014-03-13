class ProfilesController < ApplicationController
  def index
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
  end

  def new
    @profile = Profile.new
    @profile.user = current_user
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    if @profile.save
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
