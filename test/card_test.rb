require './test/test_helper'

class CardTest < Minitest::Test
  attr_reader :card

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau")
  end

  def test_it_exists
    assert_instance_of Card, card
  end

  def test_card_has_a_question
    expected = "What is the capital of Alaska?"
    assert_equal expected, card.question
  end

  def test_card_has_an_answer
    expected = "Juneau"
    assert_equal expected, card.answer
  end
end
