module Account
  class OffersController < ApplicationController
    before_action :authenticate_user!

    def index

    end
  end
end
