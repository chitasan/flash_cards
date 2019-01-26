
require 'minitest/autorun' #start from directory you're running it from
require 'minitest/pride'
require './lib/turn' #start from this file loc
require './lib/card'


class TurnTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end

  def test_it_returns_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expected = "Juneau"
    actual = turn.guess

    assert_equal "Juneau", turn.guess
  end

  def test_it_is_a_correct_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expected = true
    actual = turn.correct?

    assert_equal true, turn.correct?
  end

  def test_it_gives_feedback_for_correct_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expected = "Correct!"
    actual = turn.feedback

    assert_equal "Correct!", turn.feedback
  end

 def test_it_is_an_incorrect_guess
   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
   turn = Turn.new("Anchorage", card)

   expected = false
   actual = turn.correct?

   assert_equal false, turn.correct?
 end

 def test_it_gives_feedback_for_incorrect_guess
   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
   turn = Turn.new("Anchorage", card)

   expected = "Incorrect."
   actual = turn.feedback

   assert_equal "Incorrect.", turn.feedback
 end

end
