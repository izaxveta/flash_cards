require_relative 'test_helper'

class RoundTest < Minitest::Test
  attr_reader :card_1,
              :card_2,
              :deck,
              :round

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    @card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    @deck   = Deck.new([card_1, card_2])
    @round  = Round.new(deck)
  end

  def test_round_exists
    assert_instance_of Round, round
  end

  def test_round_takes_argument_deck
    assert_equal deck, round.deck
  end

  def test_round_starts_with_empty_guesses_array
    assert_equal [], round.guesses
  end

  def test_current_card_is_the_first_card_when_round_starts
    assert_equal card_1, round.current_card
  end

  def test_record_guess_adds_new_guess_to_guesses_array
    round.record_guess("Juneau")

    assert_equal "Juneau", round.guesses.first.response
    assert_instance_of Guess, round.guesses.first
    assert_equal 1, round.guesses.count
    assert_equal "Correct!", round.guesses.first.feedback
  end

  def test_number_correct_returns_integer_of_correctly_answered_cards
    round.record_guess("Juneau")

    assert_equal 1, round.number_correct
  end

  def test_round_records_multiple_guesses
    round.record_guess("Juneau")

    assert_equal card_2, round.current_card
    assert_equal 1, round.deck.cards.count

    round.record_guess("2")

    assert_equal 2, round.guesses.count
    assert round.deck.cards.empty?
    assert_equal "Incorrect!", round.guesses.last.feedback
    assert_equal 1, round.number_correct
  end

  def test_percent_correct_returns_final_score_of_correct_answers
    round.record_guess("Juneau")
    round.record_guess("2")

    assert_equal 2, round.guesses.count
    assert_equal 1, round.number_correct
    assert_equal 50, round.percent_correct
  end


end
