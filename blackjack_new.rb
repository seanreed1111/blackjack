 require './Deck'

 #Blackjack!

##Instructions
#We are going to build a command line blackjack game.  
#A player gets dealt two cards which have values between 1-11.  
#After they get dealt two cards you should show them the total score of their cards 
#and ask them if they want to hit or stay. A player is allowed to "hit" up to two times.  
#After each hit you should ask if they want to hit or stay and display the total value of their cards. 
#If they don't want to hit, and they are not at 21 they lose.  
#noYour program should tell them they lose and exit.

#will write a Deck class during next refactor
#Deck should have initialize,shuffle, and deal methods

cards = Deck.new

puts cards.remaining

cards.deal_all

puts cards.remaining
