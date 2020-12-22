class Game
  attr_reader :bank, :dealer, :deck, :user, :name
  def initialize(name)
    @user = User.new(name)
    @dealer = Dealer.new
    @bank = Bank.new
  end

  def player_clean_card
    @user.cards = []
    @dealer. cards = []
  end

  def card_limit?(player)
    player.card.size > 2
  end

  def score_limit(player)
    player.score > 21
  end
  def money_empty?
    @user.bank <= 0 || @dealer.bank <= 0
  end

  def new_deck
    @deck = Deck.new
  end
end
