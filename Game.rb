require './PlayingCard'
require './Deck'
require './Player'
require './Dealer'

class Game

  def initialize(setup)
    @split_allowed = setup[split_allowed]
    @double_down_allowed = setup[double_down_allowed]
    @das_allowed = setup[das_allowed] #das = double after split

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

  #preprocessing needed for third and all future cards also needed

  def preprocess_2!

  end
end
