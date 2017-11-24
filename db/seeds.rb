['inigo', 'edrizio'].each do |u|
  User.create!(email: "#{u}@regalii.com", password: 'secret123', rank: 0, games_played: 0)
end
puts "-- Added 2 users to your database"
