class Hand
  attr_reader :player, :cards, :graveyard

  def initialize(player_name)
    @player = player_name
    @cards = []
    @graveyard = []
  end

  def initiate_war(enemy_hand)
    check_hand_size(self)
    check_hand_size(enemy_hand)

  player_card = cards.pop
  enemy_card = enemy_hand.cards.pop

    if player_card.value > enemy_card.value
      puts "Player Wins!"
      graveyard.push(player_card, enemy_card)
    elsif player_card.value < enemy_card.value
      puts "Computer Wins!"
      enemy_hand.graveyard.push(player_card,enemy_card)
    else # Time to see who wins the war!
      puts "WAR Initiated....."
      player_war_facedown = cards.pop(3)
      enemy_war_facedown = enemy_hand.cards.pop(3)

      player_war_card = cards.pop
      puts "Player: #{player_war_card.show_card}"
      enemy_war_card = enemy_hand.cards.pop
      puts "Computer: #{enemy_war_card.show_card}"

        if player_war_card.value > enemy_war_card.value
          puts "Player wins!"
          graveyard.push(player_war_facedown,enemy_war_facedown,player_card,enemy_card,player_war_card, enemy_war_card).flatten!
        elsif player_war_card.value < enemy_war_card.value
          puts "Computer wins!"
          enemy_hand.graveyard.push(player_war_facedown,enemy_war_facedown,player_card,enemy_card,player_war_card, enemy_war_card).flatten!
        end

    end

  end

  def check_hand_size(hand)
    if hand.cards.empty?
      hand.cards.push(graveyard.flatten!)
    elsif hand.cards.empty? && hand.graveyard.empty?
      puts "Game over."
      exit
    end
  end
end
