class Dealer < Player
  def initialize(name = 'Dealer')
    super(name)
  end

  def take_cards(cards)
    super(cards)
    "#{name} взял карту"
  end

  def hidden_cards
    hidden_card = "*"
    @cards.each { hidden_card = "#{hidden_card}" }
    hidden_card
  end
end
