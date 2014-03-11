class DashboardController < ApplicationController
  def index
    @listing = Listing.find(params[:listing_id][:appointments])
  end
end
