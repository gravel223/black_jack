class Dealer < Player
  def initialize(name = 'Dealer')
    super()
  end

  def take_cards(cards)
    super(cards)
    puts "#{name} взял карту"
  end
end
