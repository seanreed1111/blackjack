require './PlayingCard'
require './Deck'

class Hand
  def initialize()
    @hand = [] #an array of PlayingCard objects
    @has_ace = false
    @count = 0
  end

  def hit!(deck)
    @hand << deck.deal
  end

  def busted?
    #doesn't take into account busting with aces
    #if you have one or multiple aces, your count can be
    #multi valued, but then once you are counting any ace
    #as permanently one, you can bust out
    #need to graph this out for all combinations of cards
    @count > 21 #for @has_ace == true call busted_with_aces?
  end

  def count
    @hand.each do |playingcard|
      @count += playingcard.value 
    @has_ace = @has_ace || playingcard.is_ace?
    end
    @count #for @has_ace == true call count_with_aces
  end

  def count_with_aces
    #insert method for proper count with player holding
    #one or more aces
  end

  def busted_with_aces?
    #insert method for determining if player is busted w/ aces
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


