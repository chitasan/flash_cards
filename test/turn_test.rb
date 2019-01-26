
require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'


class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_attributes
    expected = @card
    actual = @turn.card

    assert_equal expected, actual

    expected = "Juneau"
    actual = @turn.guess

    assert_equal expected, actual
  end

  def test_it_is_a_correct_guess
    assert true, @turn.correct?
  end

  def test_it_gives_feedback_for_correct_guess
    expected = "Correct!"
    actual = @turn.feedback

    assert_equal expected, actual
  end

 def test_it_is_an_incorrect_guess
   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
   turn = Turn.new("Anchorage", card)

   expected = false
   actual = turn.correct?

   refute false, turn.correct?
 end

 def test_it_gives_feedback_for_incorrect_guess
   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
   turn = Turn.new("Anchorage", card)

   expected = "Incorrect."
   actual = turn.feedback

   assert_equal "Incorrect.", turn.feedback
 end

end
