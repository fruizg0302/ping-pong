class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable

  def self.find_opponents(current_user_id)
  	opponents = User.where.not(id: current_user_id)
  end

  def self.find_email(current_user_id)
  	email = User.find(current_user_id).email
  	email
  end
end
