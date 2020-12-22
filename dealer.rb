class Dealer < Player
  def initialize(name = 'Dealer')
    super(name)
  end

  def take_cards(cards)
    super(cards)
    "#{name} взял карту"
  end
end
