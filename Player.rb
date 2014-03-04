require './Hand'
require './PlayingCard'

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
    @number_of_splits = 0
    @double_down = false #has player doubled down yet?
  end

  def clear
    @hand = Hand.new
    @split = false
    @number_of_splits = 0
    @double_down = false
  end

  def winnings(amount=0)
    @cash += amount
  end

  def has_already_split?
    @split
  end

  def has_already_doubled_down?
    @double_down
  end

  def split!
    #split the player's current hand into two hands
    @number_of_splits += 1 
    @split = true
  end

  def double_down!
    #double the player's bet and take one card
    @double_down = true
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

  #stub
  def preprocess_stub! (setup_hash)
    #pick at random
    setup_hash[["split_table", "hard_hand_table", "soft_hand_table"].sample] 
  end

  def preprocess!(setup)
    table_name = nil

    total = self.hand.total
    if self.hand.has_ace
      (total == 12 && setup["split_allowed"] ) ? table_name = "split_table" : table_name = "soft_hand_table"
    elsif self.hand.first_card == self.hand.second_card
        if total == 8 || total == 10 || (!setup["split_allowed"]) #no splits allowed
          table_name = "hard_hand_table" 
        else
          table_name = "split_table" 
        end
    else
      table_name = "hard_hand_table"
    end

    table_name
  end

  #stub. method should ultimately return "HIT", "STAND", "DOUBLE", or "SPLIT"
  def computer_play_stub!(setup, dealer_up_card_value)   
    #AI basic strategy generator
    table = self.preprocess!(setup) #this tells you the table in setup_hash needed in all scenarios
    answer = ["hit", "stand"].sample
  end

  #AI basic strategy generator 
  # Player#computer_play! should ultimately return "HIT", "STAND", "DOUBLE", or "SPLIT"
  def computer_play!(setup, dealer_up_card_value)   
    answer = nil
    lookup_value = ""
    if self.hand.number_of_cards == 2
      table_name = self.preprocess!(setup)
    else
      table_name = "hard_hand_table"
    end

    if table_name == "hard_hand_table" 
      lookup_value = self.hand.total #lookup_value should be integer
    else
      #table_name is soft_hand_table or split_table. #lookup_value should be string in either case
      self.hand.cards do |card|
        lookup_value += card.rank  
      end
      #"A" needs to be first in soft hand table
      lookup_value.reverse! if (lookup_value[0] != "A") && (table_name == "soft_hand_table")
    end
    debugger
    puts
    #answer_key will be "h", "s", "d", or "p"
    answer_key = setup[table_name][lookup_value][dealer_up_card_value]


    answer = setup[answer_key] #"hit", "stand", "double", "split"
    answer = "hit" if answer == "double" || answer == "split"  #testing only

    answer
  end
end