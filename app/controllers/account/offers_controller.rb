module Account
  class OffersController < ApplicationController
    before_action :authenticate_user!

    def index
      @offers = current_user.offers
    end
  end
end
