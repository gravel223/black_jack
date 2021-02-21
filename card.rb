class Card
  attr_reader :suit, :value, :rank
  SUITS = %w(♡ ♧ ♢ ♤).freeze
  RANKS = %w(2 3 4 5 6 7 8 9 10 J Q K A).freeze
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]

  def initialize(suit, rank, value)
    @suit = suit
    @value = value
    @rank = rank
  end

  def face
    rank + suit
  end

  def ace?
    rank == 'A'
  end
end
