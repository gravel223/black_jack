class Bank
  attr_reader :money

  TWO_BET = 20

  def initialize
    @money = 0
  end


  def table_bets
    @money += TWO_BET
  end

  def accept_bet(bet)
    @money += bet
  end

  def pay_bet(bet)
    @money -= bet
  end

end
