require './lib/card'
require './lib/deck'
require './lib/guess'
require './lib/round'

deck  = Deck.new(CardGenerator.new('cards.txt'))
round = Round.new(deck)
round.start
