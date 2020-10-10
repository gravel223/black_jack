class Deck
  CARD_SUIT = %w[♡ ♧ ♢ ♤].freeze
  CARD_VALUE = %w[1 2 3 4 5 6 7 8 9 10 J Q K A].freeze

  attr_reader :cards

  def initialize
    @cards = generate_card
  end

  private

  def generate_card
    cards = []
    CARD_SUIT.each do |suit|
      CARD_VALUE.each do |value|
        cards << Card.new(suit, value)
      end
    end
    cards.shuffle
  end
end
