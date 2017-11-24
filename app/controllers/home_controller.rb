class HomeController < ApplicationController
  def index
  	@users = User.show_leaderboard
  end
end
