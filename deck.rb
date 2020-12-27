class Deck
  CARD_SUITS = %w(♡ ♧ ♢ ♤).freeze
  CARD_RANKS = %w(2 3 4 5 6 7 8 9 10 J Q K A).freeze
  CARD_VALUES = [[11, 1], [1], [2], [3], [5], [6], [7], [8], [9], [10], [10]]

  attr_reader :cards

  def initialize
    @cards = generate_cards
  end

  private

  def generate_cards
    cards = []
    CARD_SUITS.each do |suit|
      CARD_RANKS.each_with_index do |rank, v|
        cards << Card.new(suit, rank, CARD_VALUES[v])
      end
    end
    cards.shuffle
  end
end
