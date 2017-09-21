require './lib/guess'

class Round
  attr_reader :deck,
              :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    deck.cards[0]
  end

  def record_guess(guess)
    guesses << Guess.new(guess, deck.cards.shift)
  end

  def number_correct
    guesses.select {|guess| guess.feedback == "Correct!"}.count
  end

  def percent_correct
    number_correct.to_f / guesses.count * 100
  end
end
