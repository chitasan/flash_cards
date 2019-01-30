require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require 'pry'

class CardGeneratorTest < Minitest::Test

    def test_it_exists
        filename = "./cards.txt"
        cards = CardGenerator.new(filename)
        assert_instance_of CardGenerator, cards
    end

end

# what is superclass mismatch for class?
# what if there is a comma in the text file that is not separating the row?
