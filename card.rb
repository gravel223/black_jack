class Card
  attr_reader :suit, :value, :rank
  SUITS = %w(♡ ♧ ♢ ♤).freeze
  RANKS = %w(2 3 4 5 6 7 8 9 10 J Q K A).freeze
  VALUES = [[11, 1], [1], [2], [3], [5], [6], [7], [8], [9], [10], [10]]

  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end

  def face_card
    rank + suit
  end
end
