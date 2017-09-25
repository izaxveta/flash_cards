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
    guesses << Guess.new(guess, current_card)
    deck.cards.shift
  end

  def number_correct
    guesses.select {|guess| guess.feedback == "Correct!"}.count
  end

  def percent_correct
    number_correct.to_f / guesses.count * 100
  end

  def start
    puts "Welcome! You're playing with #{deck.cards.length} cards.".center(70)
    flash_card
  end

  def divider
    puts "======================================================================\n\n".center(70)
  end

  def flash_card
    card_count = deck.cards.length
    play = 0
    until deck.cards.empty? do
      play += 1
      divider
      puts "This is card number #{play} out of #{card_count}.".center(70)
      puts "Question: #{current_card.question}".center(70)
      get_input
      record_guess(@input)
      puts guesses.last.feedback.center(70)
    end
    divider
    puts "««« GAME OVER! »»»\n".center(70)
    puts "You had #{number_correct} out of #{card_count} for a score of #{percent_correct}%.\n".center(70)
  end

  def get_input
    @input = gets.chomp
  end
end
