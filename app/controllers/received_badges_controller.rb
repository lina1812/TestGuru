class ReceivedBadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @received_badges = current_user.received_badges
  end
end
