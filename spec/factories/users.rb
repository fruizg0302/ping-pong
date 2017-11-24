FactoryBot.define do
  factory :user do
    email 'ferch@conekta.com'
    password 'cebollita123'
    score 0 
    games_played 0
    rank 0
  end

  factory :random_user, class: User do
    email { Faker::Internet.safe_email }
    password {Faker::Internet.password}
    score 0 
    games_played 0
    rank 0
  end
end