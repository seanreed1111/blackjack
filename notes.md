  #preprocessing needed for first two cards
    # 1) split_allowed?
    # 2) DAS_allowed?
    # 3)double_down_allowed?
    # 4) is_21? => if hand.total is 21, no further action needed!

  

  
    #basic algo is as follows
    #preprocess returns one of the following
    #1) soft_hand_table
    #2) hard_hand_table
    #3) split_table

    ###########################################
    #dealer.hand.cards.first is the dealer's up card. 
    #define     first = dealer.hand.cards.first.value in [1,2,3,4,5,6,7,8,9,10]
    #             total = player.hand.total

    ##### methods are all written assuming return function is used once the place in the waterfall
    ####      is established.

    ##### if player.hand has_ace?
    #####     
    ####      use split table if split_allowed? && total == 12 (player has AA and should split)
    ####      use soft hand table
    ####  else
    ####      
    ####      if player.hand.cards.first.value == player.hand.cards.second.value (check for pairs. )
    ####         compute total value in [4,6,8,10,12,14,16,18,20]

    ####         if double_down_allowed?
    ####            use double table for value = 8 or 10 (44, 55)
    ####         end
    ####         
    ####         use split table if split_allowed? 
    ####      else
    ####         use hard hand table
    ####      end
    ##### end

    #-----------------------------------------------
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
