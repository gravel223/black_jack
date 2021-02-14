class Player
  attr_reader :name
  attr_accessor :bank, :cards
  TEN = 10
  HUNDERED = 100
  def initialize(name)
    @name = name
    @bank = HUNDERED
    @cards = []
  end

  def make_money(bank)
    @bank -= TEN
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
    @score = 0
    @cards.each do |card|
      @score += if @score + card.value.max > 21
        card.value.min
      else
        card.value.max
      end
      @score
    end
  end

  def all_card
    @cards.map(&:face_card).join(' ')
  end

protected

  def can_take_cards?
    @cards.size < 3
  end
end
