class Match < ActiveRecord::Base
  validates :user_id, :opponent_id, :own_score, :oppent_score, presence: true
  validates :oppent_score, numericality: { greater_than_or_equal_to: 0 }
  validates :own_score, numericality: { greater_than_or_equal_to: 0 }
  validates :oppent_score, numericality: { less_than_or_equal_to: 21 }
  validates :own_score, numericality: { less_than_or_equal_to: 21 }
  validates :oppent_score, numericality: { only_integer: true }
  validates :own_score, numericality: { only_integer: true }
  validates_with ScoreValidator

  after_save :update_players_stats

  def update_players_stats
   User.update_match_counter(user_id)
   User.update_rank_counter(self)
  end

end
