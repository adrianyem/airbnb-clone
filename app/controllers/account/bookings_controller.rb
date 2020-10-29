module Account
  class BookingsController < ApplicationController
    before_action :authenticate_user!

    def index

    end
  end
end
