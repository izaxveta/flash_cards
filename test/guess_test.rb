require './test/test_helper'

class GuessTest < Minitest::Test
  attr_reader :card,
              :guess
  def setup
    @card  = Card.new("What is the capital of Alaska?", "Juneau")
    @guess = Guess.new("Juneau", card)
  end

  def test_guess_exists
    assert_instance_of Guess, guess
  end

  def test_card_exists
    assert_instance_of Card, card
  end

  def test_it_has_a_response
    assert_equal "Juneau", guess.response
  end

  def test_it_has_a_card
    assert_equal card, guess.card
    assert_instance_of Card, guess.card
  end

  def test_guess_correct_returns_true_if_response_matches_card_answer
    assert guess.correct?
  end

  def test_guess_feedback_returns_correct_when_response_is_correct
    assert "Correct!", guess.feedback
  end

  def test_guess_correct_returns_false_if_response_does_not_match_answer
    card  = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)

    refute guess.correct?
  end

  def test_guess_feedback_returns_incorrect_when_response_is_incorrect
    card  = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)

    assert_equal "Incorrect!", guess.feedback
  end
end
