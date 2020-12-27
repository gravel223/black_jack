class Player
  attr_reader :name
  attr_accessor :bank, :cards
  def initialize(name)
    @name = name
    @bank = 100
    @cards = []
  end

  def make_money(bank)
    @bank -= 10
    bank
  end

  def add_money(money)
    @bank += money
  end

  def take_cards(deck)
    card = deck.cards.sample
    @cards << card
    deck.cards.delete(card)
  end

  def score
  end

  def all_card
    all_card = ""
    @cards.each { |card| all_card = "#{all_card} #{card.face}" }
  end

end

protected_methods

def can_take_cards?
  @cards.size < 3
end