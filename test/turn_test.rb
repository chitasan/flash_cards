class Turn
  attr_reader :string, :card

  def initialize(string, card)
    @string = string
    @card = card
  end

  def guess
    @string
  end

  def correct? # refactor without else?
    if @string == @card.answer
      true
    else
      false
    end
  end

  def feedback
    if self.correct?
      "Correct!"
    else
      "Incorrect."
    end
  end
end
