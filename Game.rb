require './PlayingCard'
require './Deck'

class Hand
  def initialize()
    @hand = [] #an array of PlayingCard objects
  end

  def hit!(deck)
    @hand << deck.deal
  end

  def busted?
    @count > 21
  end

  def count
    count = 0
    @hand.each do |playingcard|
      count += playingcard.value #does not account for aces 1 or 11
    end
    count
  end
end

class Player
  attr_accessor :name, :cash, :hand

  def self.count
    ObjectSpace.each_object(self).count
  end
  
  def initialize(name=nil)
    @name = name
    @hand = Hand.new
  end

  def winnings(amount=0)
    @cash += amount
  end


end


