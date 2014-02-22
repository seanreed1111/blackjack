class Player

  attr_accessor :hand, :name, :cash

  def self.count
    ObjectSpace.each_object(self).count
  end
  
  def initialize(name=nil)
    @name = name
    @hand = []
  end

  def winnings(amount=0)
    @cash += amount
  end

  def hit!
  end

  def busted?
  end

  def pluralize(word)
    @@number == 1 ? word  : word + "s"
  end
end

class Dealer
end
