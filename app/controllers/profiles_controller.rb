class ProfilesController < ApplicationController
  skip_before_filter :make_profile, :only => [:new, :create]

  def index
    if params[:filter] == 'roommate'
      @profiles = Profile.roomates
    elsif params[:filter] == 'looking'
      @profiles = Profile.looking
    else
      @profiles = Profile.all
    end
  end

  def show
    @profile = current_user.profile
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @profile = Profile.new
  end

  def create
    current_user.profile = Profile.new(profile_params)
    if current_user.profile.save
      redirect_to root_path
    else
      render :new
    end
  end

  private 

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :year, :major, :activities_and_clubs, :looking_for_place, :open_to_roommates, :price_range, :avatar, :about)
  end
end
