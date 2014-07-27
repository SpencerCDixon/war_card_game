class Cards
  attr_reader :suit, :rank

    SUITS = ['♦', '♣', '♠', '♥']
    RANKS = [2,3,4,5,6,7,8,9,10,'J','Q','K','A']

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def value
    if rank == 'J' then return 11 end
    if rank == 'Q' then return 12 end
    if rank == 'K' then return 13 end
    if rank == 'A' then return 14 end
    return rank
  end

  def show_card
    puts "#{rank} of #{suit}"
  end


end
