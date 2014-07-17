

class Cards
  attr_accessor :number, :suit

  def initialize(args)
    @number = args[:number]
    @suit = args[:suit]
  end

  def show_card
    puts "#{number} of #{suit}"
  end
end
