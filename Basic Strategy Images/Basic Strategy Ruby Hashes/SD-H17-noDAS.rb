sdh17nodas ={}

#ensure no matter what that if a person doubles down on a hand they get one card only



#has the player already split? 
#only one split allowed. 
#no resplitting aces
####Then no further splitting is allowed
####this needs to be a control function rather than something that lives
####in the database to prevent unnecessary duplication
#### override the result returned to next_move if it spli

#has the player already doubled down?
#### then no further cards are given to the player
####this needs to be a control function rather than something that lives
####in the database to prevent unnecessary duplication


#dealer up card is first key - 
######value in [1,2,3,4,5,6,7,8,9,10]

# second key
##### if :player has_ace? ==true 
#####     boolean :are both cards aces?
#####         if true
####            split aces or hit if already split or split is not allowed
####          else
####            compute total value in [13,14,15,16,17,18,19,20,21]
####            figure out correct move from SOFT HAND basic strategy and dealer card
####          end
##### end

#we now know that player has a hard hand. 
# Need to rule out a split before using the hard hand table.
# have already taken two aces into account


#player has identical matching pair is the third key 

# if card1.value==card2.value
#### compute total = hand.total 
#### total has value in [4,6,8,10,12,14,16,18,20]
#### note: two aces have already been accounted for
####if splits not allowed this key should be ignored or merged

