require './lib/card'

class CardGenerator
  attr_reader :cards
  def initialize(file_path)
    @cards = card_maker(file_path)
  end

  def card_maker(file_path, deck = [])
    File.read(file_path).split("\n").map do |line|
      card = line.split(",")
      Card.new(card[0], card[1])
    end  
  end
end
