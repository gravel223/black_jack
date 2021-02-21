class Dealer < Player
  def initialize(name = 'Dealer')
    super(name)
  end

  def step(step)
    if score > 17 || @cards.size == 3
      nil
    else
      take_card(step)
    end
  end

  def hidden_cards
    hidden_card = "*"
    @cards.each { hidden_card = "#{hidden_card}" }
    hidden_card
  end
end
