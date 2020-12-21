class Game
  def initialize(user)
    @user = user
    @dealer = Dealer.new
    @bank = Bank.new
  end
end
