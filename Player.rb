require './Hand'

#the Game class knows whether the player is allowed to double down or split in any situation
#Game must enforce to player whether that is an allowed or unallowed action
class Player
  attr_accessor :name, :cash, :hand

  def self.count
    ObjectSpace.each_object(self).count
  end
  
  def initialize(name)
    @name = name
    @hand = Hand.new
    @split = false #has player split yet?
    @double_down = false #has player doubled down yet?
  end

  def clear
    @hand = Hand.new
    @split = false
    @double_down = false
  end

  def winnings(amount=0)
    @cash += amount
  end

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

  #note: separate preprocessing for third and all future cards also needed

  def preprocess! (setup_hash)
    #pick at random
    setup_hash[["split_table", "hard_hand_table", "soft_hand_table"].sample] 
  end

  def computer_play!(setup_hash)   #should return "HIT", "STAND", "DOUBLE", or "SPLIT"
    #AI basic strategy generator
    table = self.preprocess! setup_hash #this tells you the table in setup_hash needed in all scenarios
    answer = ["hit", "stand"].sample
  end

end