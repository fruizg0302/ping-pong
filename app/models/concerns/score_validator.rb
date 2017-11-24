class ScoreValidator < ActiveModel::Validator

  def validate(record)
    true
    #validate_someone_won(match)
  end

=begin
  def validate_consistent_difference(match)
    if validate_someone_won(match) && match.own_score - match.oppent_score < 1
      match.errors.add(:own_score, "You should win by a two points margin")
    elsif validate_someone_won(match) && match.oppent_score - match.own_score < 1
      match.errors.add(:oppen_score, "Your rival should win by a two points margin")
    end
  end
=end

  def validate_someone_won(match)
    if match.own_score < 21 || match.oppent_score < 21
      match.errors.add(:own_score, "Neither has won")
      match.errors.add(:oppen_score, "Neither has won")
    end
  end

  
end