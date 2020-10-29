class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @booking = current_user.bookings.new
    @offer = Offer.find(params[:offer_id])
  end

  def create
    @booking = current_user.bookings.new(booking_params)
    if @booking.save
      redirect_to account_bookings_path, notice: "Your booking is successful"
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :offer_id)
  end
end
