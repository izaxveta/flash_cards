class Guess
  attr_reader :response,
              :card

  def initialize(response, card)
    @response = response
    @card     = card
    @feedback = feedback
  end

  def correct?
    response == card.answer
  end

  def feedback
    return "Correct!"   if correct? == true
    return "Incorrect!" if correct? == false
  end
end
