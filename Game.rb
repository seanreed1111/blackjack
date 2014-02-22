require './PlayingCard'
require './Deck'

class Hand
  attr_reader :cards
  def initialize()
    @cards = [] #an array of PlayingCard objects
    @has_ace = false
  end

  def clear
    @cards = []
    @has_ace = false
  end

  def hit!(deck)
    @cards << deck.deal
  end

  def busted?
    self.total > 21 
  end

  def total
    count = 0
    @cards.each do |playingcard|
      count += playingcard.value 
    @has_ace = @has_ace || playingcard.is_ace?
    end

    #The playingcard.value of Aces = 1
    #At most one Ace per hand can have value of 11,
    #but this +10 added to count must not make 
    #the player's count go over 21

    if @has_ace
      return count + 10 if count + 10 <= 21 
    end

    return count
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


