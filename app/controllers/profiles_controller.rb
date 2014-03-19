class ProfilesController < ApplicationController
  skip_before_filter :make_profile, :only => [:new, :create]
  has_scope :open_to_roommates, type: :boolean
  has_scope :looking_for_place, type: :boolean



  def index
    @profiles = apply_scopes(Profile).all
    @uploader = Profile.new.avatar
    @uploader.success_action_redirect = new_profile_url
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
    @uploader = Profile.new.avatar
    @uploader.success_action_redirect = new_profile_url
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
