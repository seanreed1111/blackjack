require './Deck'
require './PlayingCard'
require './Game'


cards = Deck.new
players = []
puts "Blackjack! How many players?"
number_of_players = gets.chomp.to_i

number_of_players.times do
  players << Player.new("Player #{Player.count+1}")
end

puts "Great! we have #{number_of_players} players"
puts "Let's deal!"

players.each do |player|
  2.times {player.hand.hit! cards}
end

puts "ok, so far the players have the following totals:"

players.each do |player|
  puts "#{player.name} has #{player.hand.count}"
end

