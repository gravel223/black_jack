class Deck

  attr_reader :cards

  def initialize
    @cards = generate_cards
  end

  def give_card
    @cards.delete_at(0)
  end

  private

  def generate_cards
    cards = []
    Card::SUITS.each do |suit|
      Card::RANKS.each_with_index do |rank, v|
        cards << Card.new(suit, rank, Card::VALUES[v])
      end
    end
    cards.shuffle
  end
end
