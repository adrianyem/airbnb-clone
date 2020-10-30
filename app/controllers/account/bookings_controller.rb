module Account
  class BookingsController < ApplicationController
    before_action :authenticate_user!

    def index
      @bookings = current_user.bookings.includes(:offer)
    end
  end
end
