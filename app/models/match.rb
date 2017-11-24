class Match < ActiveRecord::Base
  validates :user_id, :opponent_id, :own_score, :oppent_score, presence: true
  validates :oppent_score, :numericality => { :greater_than_or_equal_to => 0 }
  validates :own_score, :numericality => { :greater_than_or_equal_to => 0 }
  validates :oppent_score, :numericality => { :only_integer => true }
  validates :own_score, :numericality => { :only_integer => true }
  validates_with ScoreValidator

end
