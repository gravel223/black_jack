class Player
  attr_reader :name
  attr_accessor :bank, :card
  def initialize
    @name = name
    @bank = 100
    @card = []
  end

  def make_money(bank)
    @bank -= 10
    bank.accept_bet(10)
  end

  def add_money(money)
    @bank += money
  end
end
