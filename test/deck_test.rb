require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeskTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_has_attributes
    expected = @cards
    actual = @deck.cards

    assert_equal expected, actual
  end

  def test_it_can_count_cards
    assert_equal 3, @deck.count
  end

  def test_it_can_count_cards_in_each_category
    expected = [@card_2, @card_3]
    actual = @deck.cards_in_category(:STEM)

    assert_equal expected, actual

    expected = [@card_1]
    actual = @deck.cards_in_category(:Geography)

    assert_equal expected, actual

    expected = []
    actual = @deck.cards_in_category("Pop Culture")

    assert_equal expected, actual
    end

end
