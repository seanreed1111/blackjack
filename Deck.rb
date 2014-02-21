require './PlayingCard'
class Deck
    SUITS = [:clubs, :hearts, :diamonds, :spades]
    RANKS = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
    VALUES = [1,2,3,4,5,6,7,8,9,10,10,10,10]

    def initialize
        @cards = []
        SUITS.each do |suit|
            RANKS.each_with_index do |rank, i|
                @cards << PlayingCard.new(suit, rank, VALUES[i])
            end
        end
    end

    def shuffle
    end

    def deal(number_of_cards=1)
        current = @cards.pop
        puts "Dealing...#{current.rank} of #{current.suit}"
        current
    end

    def remaining
        @cards.length
    end

    def deal_all
        number_of_cards = @cards.length
        number_of_cards.times do 
           deal
        end
    end
end
