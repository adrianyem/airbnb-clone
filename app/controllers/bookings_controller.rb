class BookingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @booking = current_user.bookings.new(booking_params)
    if @booking.save
      redirect_to account_bookings_path, notice: "Your booking is successful"
    else
      redirect_to offer_path(@booking.offer), alert: @booking.errors.full_messages.join("\n")
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :offer_id)
  end
end
