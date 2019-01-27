require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

card_1 = Card.new("What team won the 2018 Super Bowl?", "Philadelphia Eagles", :NFL)
card_2 = Card.new("What team won the 2018 World Series", "Boston Red Sox", :MLB)
card_3 = Card.new("What team won the 2018 NBA Championship?", "Golden State Warriors", :NBA)
card_4 = Card.new("What team won the 2018 Stanley Cup", "Washington Capitals", :NHL)
card_5 = Card.new("What team is the AFC Champion in 2019?", "New England Patriots", :NFL)
card_5 = Card.new("What team is the NFC Champion in 2019?", "Los Angeles Rams", :NFL)
card_6 = Card.new("How many innings are in a baseball game?", "9", :MLB)
card_7 = Card.new("Who owns the Dallas Mavericks?", "Mark Cuban", :NBA)
card_8 = Card.new("Who is the all-time NHL leader in points?", "Wayne Gretzky", :NHL)

cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8]

deck = Deck.new(cards)
round = Round.new(deck)

round.start

until round.turns.length == round.deck.count do
  p "This is question #{round.turns.length + 1} of #{round.deck.count}."
  p round.current_card.question
  p "Take a guess:"
  guess = gets.chomp
  round.take_turn(guess)
  p round.turns.last.feedback
  p "-" * 30
end

p "*** Game Over! ***"
p "You have #{round.number_correct} correct guesses out of #{round.deck.count} for a total score of #{round.percent_correct.round.to_i}."
p "NFL - #{round.percent_correct_by_category(:NFL).round.to_i}% correct"
p "MLB - #{round.percent_correct_by_category(:MLB).round.to_i}% correct"
p "NBA - #{round.percent_correct_by_category(:NBA).round.to_i}% correct"
p "NHL - #{round.percent_correct_by_category(:NHL).round.to_i}% correct"
