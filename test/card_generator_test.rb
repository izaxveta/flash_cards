require_relative 'test_helper'

class CardGeneratorTest < Minitest::Test
  attr_reader :generator

  def setup
    @generator = CardGenerator.new('cards.txt')
  end

  def test_it_exists
    assert_instance_of CardGenerator, generator
  end

  def test_generator_makes_cards
    expected = CardGenerator.new('cards.txt').cards

    assert_instance_of Array, expected
    assert_instance_of Card, expected.first
  end
end
