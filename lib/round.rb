require './lib/card'
require './lib/turn'

class Round
  attr_reader :deck, 
              :turns, 
              :current_card

  def initialize(deck)
     @deck = deck
     @turns = []
     @current_card = deck.cards[0]
   end

   def take_turn(guess)
     new_turn = Turn.new(guess, current_card)
     @turns << new_turn
     @current_card = deck.cards[turns.length]
     new_turn
   end

   def number_correct
    correct = 0
    @turns.each do |turn|
      if turn.correct?
        correct += 1
      end
    end
     correct
  end

   def number_correct_by_category(category)
     correct = 0
     @turns.each do |turn|
       if turn.card.category == category and turn.correct?
            correct += 1
       end
     end
      correct
   end

   def percent_correct
     100 * (number_correct.to_f / @turns.length.to_f)
   end

   def number_of_turn_by_category(category)
     turn_by_category = 0
     @turns.each do |turn|
       if turn.card.category == category
          turn_by_category += 1
       end
     end
     turn_by_category
  end

   def percent_correct_by_category(category)
     100 * (number_correct_by_category(category).to_f / number_of_turn_by_category(category).to_f)
   end

   def start
    p "Welcome to Sports Trivia!"
    p "You're playing with #{@deck.count} cards."
    p "-" * 30
   end
end