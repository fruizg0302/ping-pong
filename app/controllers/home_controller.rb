class HomeController < ApplicationController
  def index
  	@users = User.show_leaderboard
  end

  def history
  end

  def log
  end
end
