class OffersController < ApplicationController
  def show
    @offer = Offer.find_by_id(params[:id])
    @booking = @offer.bookings.build
  end
end
