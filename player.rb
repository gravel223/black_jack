class Player
  attr_reader :name
  attr_accessor :bank, :cards

  TEN = 10
  HUNDRED = 100

  def initialize(name)
    @name = name
    @bank = HUNDRED
    @cards = []
  end

  def make_money(bank)
    @bank -= TEN
    bank
  end

  def add_money(money)
    @bank += money
  end

  def take_card(deck)
    if can_take_cards?
      card = deck.give_card
      @cards << card
      card
    end
  end

  def score
    @score = @cards.sum(&:value)
    @cards.select(&:ace?).each do
      @score -= 10 if @score > 21
    end
    @score
  end

  def all_card
    @cards.map(&:face).join(' ')
  end

  protected

  def can_take_cards?
    @cards.size < 3
  end
end
