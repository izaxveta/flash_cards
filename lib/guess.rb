class Guess
  attr_reader :response,
              :card,
              :feedback

  def initialize(response, card)
    @response = response
    @card     = card
    @feedback = feedback
  end

  def correct?
    response.downcase == card.answer.downcase
  end

  def feedback
    return "Correct!"   if correct?
    return "Incorrect!" if correct? == false
  end
end
