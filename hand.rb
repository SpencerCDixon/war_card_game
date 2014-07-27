class Hand
  attr_reader :player, :cards, :graveyard

  def initialize(player_name)
    @player = player_name
    @cards = []
    @graveyard = []
  end

  def initiate_war(enemy_hand)

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
        if cards.size >=4
          player_war_facedown = cards.pop(3)
        else
          clear_graveyard

          if cards.size >= 4
            player_war_facedown = cards.pop(3)
          else
            cards_size = cards.size - 1
            player_war_facedown = cards.pop(cards_size)
          end

        end

        if enemy_hand.cards.size >= 4
          enemy_war_facedown = enemy_hand.cards.pop(3)
        else
          enemy_hand.clear_graveyard

          if enemy_hand.cards.size >= 4
          enemy_war_facedown = enemy_hand.cards.pop(3)
          else
          enemy_cards_size = enemy_hand.cards.size - 1
          enemy_war_facedown = enemy_hand.cards.pop(enemy_cards_size) #Leaves 1 card left for flip
          end

        end


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


  def clear_graveyard
    graveyard.each {|card| cards << card}
    graveyard.clear
    puts "Graveyard has been moved into cards"
    cards.shuffle
  end

  def graveyard_check
    if cards.empty? && graveyard.empty?
      puts "Game Over."
      exit
    elsif graveyard.size >= 1 && cards.empty?
      clear_graveyard
    else
      puts "Still cards in hand.."
    end
  end



end
