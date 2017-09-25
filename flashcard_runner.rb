require './lib/card'
require './lib/deck'
require './lib/guess'
require './lib/round'

card1 = Card.new("What is 5 + 5?", "10")
card2 = Card.new("What is Rachel's favorite animal?", "panda")
card3 = Card.new("What is Mike's middle name?", "nobody knows")
card4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber")
deck  = Deck.new([card1, card2, card3, card4])
round = Round.new(deck)
round.start
