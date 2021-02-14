class Game
  attr_reader :bank, :dealer, :deck, :user, :name
  def initialize(name)
    @user = User.new(name)
    @dealer = Dealer.new
    @bank = Bank.new
  end

  def player_clean_card
    @user.cards = []
    @dealer.cards = []
  end

  def moneys_of_winner
    if win
      win.add_money(@bank.money)
    else
      amount = @bank.money / 2
      @user.add_money(amount)
      @dealer.add_money(amount)
    end
    @bank.pay_bet(@bank.money)
  end

  def win
    if score_limit?(@user)
      @dealer
    elsif score_limit?(@dealer)
      @user
    elsif @dealer.score != @user.score
      [@user, @dealer].max_by(&:score)
    end
  end

  def card_limit?(player)
    player.cards.size > 2
  end

  def score_limit?(player)
    player.score > 21
  end
  def money_empty?
    @user.bank <= 0 || @dealer.bank <= 0
  end

  def take_two_card_make_bet
    @user.make_money(@bank)
    @dealer.make_money(@bank)
    2.times do
      @user.take_cards(@deck)
      @dealer.take_cards(@deck)
    end
  end

  def new_deck
    @deck = Deck.new
  end
end
