# require './cards.rb'
#
# H_2 = Cards.new(number: 2, suit: "hearts")
# H_3 = Cards.new(number: 3, suit: "hearts")
# H_4 = Cards.new(number: 4, suit: "hearts")
# H_5 = Cards.new(number: 5, suit: "hearts")
# H_6 = Cards.new(number: 6, suit: "hearts")
# H_7 = Cards.new(number: 7, suit: "hearts")
# H_8 = Cards.new(number: 8, suit: "hearts")
# S_10 = Cards.new(number: 10, suit: "spades")
#
#
# # Set up deck of cards and the two hands
# DECK = [H_2, H_3, H_4, H_5, H_6, H_7, H_8, S_10]
# computer_hand = []
# player_hand = []
# computer_winning_cards = []
# player_winning_cards = []
#
# # Shuffle Deck and pass out cards
# DECK.shuffle!
# 4.times {computer_hand << DECK.pop }
# 4.times {player_hand << DECK.pop}
#
# loop do
#   print "Computer: "
#   print computer_hand[-1].show_card
#   puts " "
#   print "Player: "
#   print player_hand[-1].show_card
#
#   if computer_hand[-1].number > player_hand[-1].number
#     puts "Computer Wins!"
#     computer_winning_cards << player_hand.pop
#     computer_winning_cards << computer_hand.pop
#   else
#     puts "Player Wins!"
#     player_winning_cards << computer_hand.pop
#     player_winning_cards << player_hand.pop
#   end
#
#   puts "comp"
#   computer_hand.each {|x| x.show_card}
#   puts "player"
#   player_hand.each {|x| x.show_card}
#
#   if computer_hand == []
#     computer_hand = computer_winning_cards.shuffle!
#   end
#
#   if player_hand == []
#     player_hand = player_winning_cards.shuffle!
#   end
#
#   break if (computer_hand == [] && computer_winning_cards == [])|| (player_hand == [] && player_winning_cards == [])
# end
#
# if computer_hand == [] && computer_winning_cards == []
#   puts "Player wins!"
# else
#   puts "Computer wins!"
# end
#
require './deck.rb'
require './cards.rb'
require './hand.rb'



deck = Deck.new
player_hand = Hand.new('Player')
computer_hand = Hand.new('Computer')
deck.deal_cards(player_hand)
deck.deal_cards(computer_hand)

while true
  player_hand.check_hand_size(player_hand)
  computer_hand.check_hand_size(computer_hand)

puts "Player Hand:"
puts player_hand.cards[-1].show_card

puts "Computer Hand:"
puts computer_hand.cards[-1].show_card

player_hand.initiate_war(computer_hand)

puts "Player graveyard:"
player_hand.graveyard.each {|card| puts card.show_card}

puts "Computer graveyard:"
computer_hand.graveyard.each {|card| puts card.show_card}

end
