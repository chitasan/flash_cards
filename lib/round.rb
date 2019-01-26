require './lib/turn'

class Round

  attr_reader :deck, :turns, :current_card

  def initialize(deck)
     @deck = deck
     @turns = []
     @current_card = deck.cards[0]
   end

   def take_turn(guess)
   end

   def number_correct
   end

   def number_correct_by_category(category)
   end

   def percent_correct
   end

   def percent_correct_by_category(category)
   end

 end
