sdh17nodas ={}

#preprocessing needed for first two cards
  # 1) split_allowed?
  # 2) DAS_allowed?
  # 3)double_down_allowed?
  # 4) is_21? => if hand.total is 21, no further action needed
  # 5)

#dealer.hand.cards.first is the dealer's up card. 
#  define     first = dealer.hand.cards.first.value in [1,2,3,4,5,6,7,8,9,10]
#             total = player.hand.total

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



#preprocessing needed for first three cards
#doubled_down?  => if hand has already been doubled down, no more cards allowed
# if player has already split,
##### update split_allowed? depending on if multiple splits
##    are possible. 
####  Also ensure that hand cannot resplit AA a second time