class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable
  before_save :default_values


  def default_values
    self.games_played ||= 0
    self.rank         ||= 0
    self.score        ||= 0
  end

  def self.find_opponents(current_user_id)
    User.where.not(id: current_user_id)
  end

  def self.find_email(current_user_id)
    email = User.find(current_user_id).email
    email
  end

  def self.update_match_counter(user_id) 
    user = find_user(user_id)
    if user.games_played.present?
      user.games_played = user.games_played + 1
    else
      user.games_played = 1
    end
    user.save
  end

  def self.update_rank_counter(match)
    user = find_user(match.user_id)
    user.rank = 1 if user.rank.nil?

    if match.own_score >= 21
      points = calculate_rank_points(match.user_id, match.opponent_id)
      user.rank = user.rank + points
    end
    user.save
  end

  def self.find_user(user_id)
    User.find(user_id)
  end

  def self.show_leaderboard
    User.all
  end

  def self.calculate_rank_points(own_id, opponent_id)
    if obtain_rank(own_id) > obtain_rank(opponent_id)
      3
    else
      1
    end
  end

  def self.obtain_rank(id)
    User.find(id).rank
  end
end
