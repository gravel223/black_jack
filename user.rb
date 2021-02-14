class User < Player
  attr_reader :name
  def initialize(name)
      super(name)
  end

  def take_cards(cards)
    card = super(cards)
    puts "#{name} взял карту #{card.face_card}"
  end
end
