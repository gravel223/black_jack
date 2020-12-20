class Controller
  def initialize(user)
    @user = user
    @dealer = Dealer.new
    @bank = Bank.new
  end
end
