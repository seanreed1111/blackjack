require './Player'
require './Dealer'
require './Deck'


class Game
  attr_reader :computer_players, :human_players, :dealer, :deck, :setup_hash
  def initialize(setup_hash)
    @setup_hash = setup_hash
    @split_allowed = setup_hash["split_allowed"]
    @double_down_allowed = setup_hash["double_down_allowed"]
    @das_allowed = setup_hash["das_allowed"] #das = double after split
    @human_players = [] # array of player objects
    @computer_players = [] #array of player objects
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def player_setup!(num_humans, num_bots)
    return "error" if num_humans + num_bots > 7 
    num_humans.times do
      @human_players << Player.new("Human Player #{Player.count+1}")
    end

    num_bots.times do
      @computer_players << Player.new("Bot Player #{Player.count+1}")
    end

    nil
  end

  def first_two_cards!

    2.times {
      @human_players.each do |player|
        player.hand.hit! deck
      end

      @computer_players.each do |player|
        player.hand.hit! deck
      end

      @dealer.hand.hit! deck
    }
  end



  def split_allowed?
    @split_allowed
  end

  def double_down_allowed?
    @double_down_allowed
  end

  def das_allowed? 
    @das_allowed
  end



  #preprocessing needed for first two cards
  # 1) split_allowed?
  # 2) DAS_allowed?
  # 3)double_down_allowed?
  # 4) is_21? => if hand.total is 21, no further action needed!

  

  def preprocess 
    #basic algo is as follows

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
  end

  #note: separate preprocessing for third and all future cards also needed
end
