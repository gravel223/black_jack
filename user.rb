class User < Player
  attr_reader :name
  def initialize(name)
    super(name)
  end
  def take_card(cards)
    card = super(cards)
    "#{name} взял карту #{card.face_card}"
  end
end
