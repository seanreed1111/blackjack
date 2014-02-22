 require './Deck'
 require './PlayingCard'
 require './Game'


  cards = Deck.new
  players = []
  puts "Blackjack! How many players?"
  number_of_players = gets.chomp.to_i

  number_of_players.times do
    players << Player.new
  end

  puts "Great! we have #{Player.count} players"

