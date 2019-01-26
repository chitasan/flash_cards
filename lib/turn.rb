class Turn
  attr_reader :string, :card

  def initialize(string, card)
    @string = string
    @card = card
  end

  def guess
    @string
  end

  def correct?
    if @string.downcase == @card.downcase
      true
    else
      false
    end
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end

end
