require './cards.rb'

H_2 = Cards.new(number: 2, suit: "hearts")
H_3 = Cards.new(number: 3, suit: "hearts")
H_4 = Cards.new(number: 4, suit: "hearts")
H_5 = Cards.new(number: 5, suit: "hearts")
H_6 = Cards.new(number: 6, suit: "hearts")
H_7 = Cards.new(number: 7, suit: "hearts")
H_8 = Cards.new(number: 8, suit: "hearts")
S_10 = Cards.new(number: 10, suit: "spades")


# Set up deck of cards and the two hands
DECK = [H_2, H_3, H_4, H_5, H_6, H_7, H_8, S_10]
COMPUTER_HAND = []
PLAYER_HAND = []

# Shuffle Deck and pass out cards
DECK.shuffle!
4.times {COMPUTER_HAND << DECK.pop }
4.times {PLAYER_HAND << DECK.pop}


print "Computer: "
print COMPUTER_HAND[-1].show_card
puts " "
print "Player: "
print PLAYER_HAND[-1].show_card

if COMPUTER_HAND[-1].number > PLAYER_HAND[-1].number
  puts "Computer Wins!"
  COMPUTER_HAND << PLAYER_HAND.pop
else
  puts "Player Wins!"
  PLAYER_HAND << COMPUTER_HAND.pop
end

puts "comp"
COMPUTER_HAND.each {|x| x.show_card}
puts "player"
PLAYER_HAND.each {|x| x.show_card}



