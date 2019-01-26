require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'

class Roundtest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_has_attributes
    assert_equal @deck, @round.deck
    assert_equal [], @round.turns
    assert_equal @card_1, @round.current_card
  end 

  def test_if_card_turns_after_a_guess
    new_turn = @round.take_turn("Juneau")

    assert_equal [new_turn], @round.turns
  end

  def test_the_current_card_after_turn
    new_turn = @round.take_turn("Juneau")

    assert_equal @card_2, @round.current_card
  end

  def test_number_of_guesses_correct
    new_turn = @round.take_turn("Juneau")
    new_turn = @round.take_turn("Venus")
    new_turn = @round.take_turn("North north west")

    assert_equal 2, @round.number_correct
  end

  def test_it_has_if_previous_guess_is_correct_with_feedback
    new_turn = @round.take_turn("Juneau")
    new_turn = @round.take_turn("Venus")

    refute false, @round.turns.last.correct?
    assert_equal "Incorrect.", @round.turns.last.feedback
  end

  def test_it_can_count_turns
    new_turn = @round.take_turn("Juneau")
    new_turn = @round.take_turn("Venus")

    assert_equal 2, @round.turns.length
  end

  def test_number_of_guesses_correct_by_category
    new_turn = @round.take_turn("Juneau")
    new_turn = @round.take_turn("Venus")

    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 0, @round.number_correct_by_category(:STEM)
  end

  def test_percent_of_guesses_correct
    new_turn = @round.take_turn("Juneau")
    new_turn = @round.take_turn("Venus")

    assert_equal 50.0, @round.percent_correct
  end

  def test_number_of_turn_by_category
    new_turn = @round.take_turn("Juneau")
    new_turn = @round.take_turn("Venus")

    assert_equal 1, @round.number_of_turn_by_category(:Geography)
    assert_equal 1, @round.number_of_turn_by_category(:STEM)
    assert_equal 0, @round.number_of_turn_by_category(:Reading)
  end

  def test_percent_of_guesses_correct_by_category
    new_turn = @round.take_turn("Juneau")
    new_turn = @round.take_turn("Venus")

    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
  end

end
