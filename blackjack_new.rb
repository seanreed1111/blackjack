require './Game'
require './SD-H17-noDAS.rb'

#pull in setup_hash for the game from SD-H17-noDAS.rb

#make sure you account for what happens if you run out of cards mid-deal

game = Game.new(Rules.new.load!)

puts "Blackjack! How many Human players?"
num_humans = gets.chomp.to_i

puts "Blackjack! How many bot players?(max #{7-num_humans})"
num_bots = gets.chomp.to_i

game.player_setup!(num_humans, num_bots)
game.first_two_cards! #distributes cards to all players AND dealer. 
game.preprocess! if num_bots > 0 #runs initial bot preprocessing

 puts "Great! we have #{Player.count} players"
 puts "Let's deal! The dealer shows "

puts "#{game.dealer.hand.first_card.show}"
puts ""
puts "The players have the following cards:"

game.human_players.each do |player|
  puts "#{player.name} "
  player.hand.cards.each do |card|
      print "#{card.show} "
  end
  puts "Total is #{player.hand.total}."
end

game.computer_players.each do |player|
  puts "#{player.name} "
  player.hand.cards.each do |card|
      print "#{card.show} "
  end
  puts "Total is #{player.hand.total}."
end

puts "The dealer shows "
puts "#{game.dealer.hand.first_card.show}"

# bots need to decide what to do next given available information
# info is contained in game.setup hash

#loop over all human players
#players should be allowed to
# 1) Hit
# 2) Stand
# 3) Double Down
# 4) Split

players.each do |player|
   while (true) do 
    puts "#{player.name} you have #{player.hand.total}. Would you like to hit or stand?"
    answer = gets.chomp.downcase
    break if answer == "stand"

    if answer == "hit"

      player.hand.hit! deck

      if player.hand.busted?
        print "sorry, you busted, you have "
          player.hand.cards.each do |card|
              print "#{card.show} "
          end
        puts
      end
    end
    break if player.hand.busted?
  end
end

#loop over all bots
#bots should be allowed to
# 1) Hit
# 2) Stand
# 3) Double Down
# 4) Split

while true do

  break
end

-----------------------------------------------
#the following block works with human players
# deck = Deck.new

# deck.shuffle!

# players = [] #an array of Player objects
# puts "Blackjack! How many players?"
# number_of_players = gets.chomp.to_i

# number_of_players.times do
#   players << Player.new("Player #{Player.count+1}")
# end

# puts "Great! we have #{number_of_players} players"
# puts "Let's deal! The dealer shows "

# players.each do |player|
#   2.times {player.hand.hit! deck}
# end

# dealer = Dealer.new
# 2.times {dealer.hand.hit! deck}
# puts "#{dealer.hand.first_card.show}"
# puts ""
# puts "The players have the following cards:"

# players.each do |player|
#   puts "#{player.name} "
#   player.hand.cards.each do |card|
#       print "#{card.show} "
#   end
#   puts "Total is #{player.hand.total}."
# end

# players.each do |player|
#    while (true) do 
#     puts "#{player.name} you have #{player.hand.total}. Would you like to hit or stand?"
#     answer = gets.chomp.downcase
#     break if answer == "stand"

#     if answer == "hit"

#       player.hand.hit! deck

#       if player.hand.busted?
#         print "sorry, you busted, you have "
#           player.hand.cards.each do |card|
#               print "#{card.show} "
#           end
#         puts
#       end
#     end
#     break if player.hand.busted?
#   end
# end

# #dealer's rules: must hit soft 17
# #                must stand on hard 17 or higher
# #                must hit everything else

# while (true) do
#   dealer_total = dealer.hand.total
#   puts "dealer_total = #{dealer_total} at beginning of while loop"
#   break if dealer_total >= 18
#   break if dealer_total == 17  && !dealer.hand.has_ace #hard 17
#   dealer.hand.hit! deck
# end
# puts "Dealer has"
# dealer.hand.cards.each do |card|
#   print "#{card.show} "
# end
# puts "dealer_total is #{dealer_total}"

# dealer_busted = dealer.hand.busted?

# players.each do |player|
#   next if player.hand.busted?
#   if dealer_busted || (player.hand.total > dealer_total)
#     puts "#{player.name} wins! "
#     player.hand.win = true
#     #adjust player's winnings by the amount of the bet
#   end 
# end
# puts

