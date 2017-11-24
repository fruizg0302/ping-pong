class ScoreValidator < ActiveModel::Validator

  def validate(record)
    validate_someone_won(record)
  end

  def validate_someone_won(match)
    if match.own_score >= 21 && (match.own_score - match.oppent_score) > 2
      match.errors.add(:own_score, 'Neither has won')
      match.errors.add(:oppent_score, 'Neither has won')
    end
  end
  
end