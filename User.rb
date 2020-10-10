class User
  def initialize(name)
    @name = name
    @cards = []
    @balanse = START_BALANSE
  end

  def make_bet
    @balanse - BET_AMOUNT
  end

  protected

  BET_AMOUNT = 10
  START_BALANSE = 100
end
