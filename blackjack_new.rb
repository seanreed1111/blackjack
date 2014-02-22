require './Deck'
require './PlayingCard'
require './Game'


deck = Deck.new
players = [] #an array of Player objects
puts "Blackjack! How many players?"
number_of_players = gets.chomp.to_i

number_of_players.times do
  players << Player.new("Player #{Player.count+1}")
end

puts "Great! we have #{number_of_players} players"
puts "Let's deal!"

players.each do |player|
  2.times {player.hand.hit! deck}
end

puts "ok, so far the players have the following cards:"

players.each do |player|
  print "#{player.name} "
  player.hand.cards.each do |card|
      print "#{card.show} "
  end
  puts "Total is #{player.hand.total}. Busted = #{player.hand.busted?}"
end

players.each do |player|
  

  while (true) do

    break
  end
  
end