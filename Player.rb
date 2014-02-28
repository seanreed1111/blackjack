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



  def play!
    #function to get computer to play 
    #basic strategy autonomously via AI
  end
end