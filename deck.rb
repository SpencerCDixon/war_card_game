require_relative 'cards'
require_relative 'hand'


class Deck
      attr_reader :cards

      def initialize
        @cards = self.build_deck
      end

      def build_deck
          cards = []

          Cards::SUITS.each do |suit|
          Cards::RANKS.each do |rank|
            cards << Cards.new(suit,rank)
              end
            end
          cards.shuffle
      end

      def deal_cards(hand)
        26.times do
        card = cards.pop
        hand.cards << card
        end
      end

end
