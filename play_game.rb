require './deck.rb'
require './cards.rb'
require './hand.rb'

deck = Deck.new
player_hand = Hand.new('Player')
computer_hand = Hand.new('Computer')
deck.deal_cards(player_hand)
deck.deal_cards(computer_hand)


while true
  player_hand.graveyard_check
  computer_hand.graveyard_check

  puts
  print "Player Hand:  "
  puts player_hand.cards[-1].show_card

  print "Computer Hand:  "
  puts computer_hand.cards[-1].show_card
  puts
  
  player_hand.initiate_war(computer_hand)
end
