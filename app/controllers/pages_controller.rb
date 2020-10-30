class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @offers = Offer.includes(:owner)
  end
end
