class HomesController < ApplicationController
  def index
    @recent_listings = Listing.all.last(8)
  end
end
