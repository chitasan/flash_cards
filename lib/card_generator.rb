require './lib/card'
require 'csv'
require 'pry'

class CardGenerator
    attr_reader :filename

    def initialize(filename)
        @filename = filename
    end

    def open_file(filename)
      CSV.open(filename)
    end

    def turn_file_into_cards(filename)
      CSV.open(filename).map do |card|
        question = card[0]
        answer = card[1]
        category = card[2]
        Card.new(question, answer, category)
      end
    end

end
