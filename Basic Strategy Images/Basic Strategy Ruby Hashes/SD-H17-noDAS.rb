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

#preprocessing needed for first three cards
#doubled_down?  => if hand has already been doubled down, no more cards allowed
# if player has already split,
##### update split_allowed? depending on if multiple splits
##    are possible. 
####  Also ensure that hand cannot resplit AA a second time

split_table = {}  
#keys are in following order: A,2,3,4,5,6,7,8,9,10
#ensure that basic strategy table is set up with A in first position!!!

split_table["AA"] = {1=>"p", 2=>"p",3=>"p",4=>"p",5=>"p",6=>"p",7=>"p",
                     8=>"p",9=>"p",10=>"p"} 
split_table["22"] = {1=>"h",2=>"h",3=>"p",4=>"p",5=>"p",6=>"p",7=>"p",
                     8=>"h",9=>"h",10=>"h"}
split_table["33"] = {1=>"h",2=>"h",3=>"h",4=>"p",5=>"p",6=>"p",7=>"p",
                     8=>"h",9=>"h",10=>"h"}
split_table["44"] = {1=>"h",2=>"h",3=>"h",4=>"h",5=>"d",6=>"d",7=>"h",
                     8=>"h",9=>"h",10=>"h"}
split_table["55"] = {1=>"h",2=>"d",3=>"d",4=>"d",5=>"d",6=>"d",7=>"d",
                     8=>"d",9=>"d",10=>"h"}
split_table["66"] = {1=>"h",2=>"p",3=>"p",4=>"p",5=>"p",6=>"p",7=>"h",
                     8=>"h",9=>"h",10=>"h"}
split_table["77"] = {1=>"h",2=>"p",3=>"p",4=>"p",5=>"p",6=>"p",7=>"p",
                     8=>"h",9=>"h",10=>"s"}
split_table["88"] = {1=>"p",2=>"p",3=>"p",4=>"p",5=>"p",6=>"p",7=>"p",
                     8=>"p",9=>"p",10=>"p"}
split_table["99"] = {1=>"s",2=>"p",3=>"p",4=>"p",5=>"p",6=>"p",7=>"s",
                     8=>"p",9=>"p",10=>"s"}
split_table["1010"] = {1=>"s",2=>"s",3=>"s",4=>"s",5=>"s",6=>"s",7=>"s",
                      8=>"s",9=>"s",10=>"s"}


soft_hand_table = {}
soft_hand_table["A2"] = {2=>"h", 3=>"h", 4=>"d",5=>"d",6=>"d",7=>"h",8=>"h", 9=>"h",10=> "h",1=>"h"}
soft_hand_table["A3"] = {2=>"h", 3=>"h", 4=>"d", 5=>"d", 6=>"d", 7=>"h", 8=>"h", 9=>"h", 10=>"h",1=>"h"}
soft_hand_table["A4"] = {2=>"h",3=>"h",4=>"d", 5=>"d", 6=>"d", 7=>"h", 8=>"h", 9=>"h", 10=>"h",1=>"h"}
soft_hand_table["A5"] = {2=>"h",3=>"h",4=>"d", 5=>"d", 6=>"d", 7=>"h", 8=>"h", 9=>"h", 10=>"h",1=>"h"}
soft_hand_table["A6"] = {2=>"d",3=>"d",4=>"d", 5=>"d", 6=>"d", 7=>"h", 8=>"h", 9=>"h", 10=>"h",1=>"h"}
soft_hand_table["A7"] = {2=>"s",3=>"d",4=>"d", 5=>"d", 6=>"d", 7=>"s", 8=>"s", 9=>"h", 10=>"h",1=>"s"}
soft_hand_table["A8"] = {2=>"s",3=>"s",4=>"s", 5=>"s", 6=>"d", 7=>"s", 8=>"s", 9=>"s", 10=>"s",1=>"s"}
soft_hand_table["A9"] = {2=>"s",3=>"s",4=>"s", 5=>"s", 6=>"s", 7=>"s", 8=>"s", 9=>"s", 10=>"s",1=>"s"}
