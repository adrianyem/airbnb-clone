class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @booking = current_user.bookings.new
    @offer = Offer.find(params[:offer_id])
  end

  def create
    @booking = current_user.bookings.new(booking_params)
    if @booking.save
      flash[:notice] = "Your booking is successful"
      redirect_to account_bookings_path
    else
      flash[:alert] = @booking.errors.full_messages
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :offer_id)
  end
end
