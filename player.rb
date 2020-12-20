class Player
  attr_reader :name
  attr_accessor :bank, :card
  def initialize
    @name = name
    @bank = 100
    @cards = []
  end

  def make_money(bank)
    @bank -= 10
    bank.accept_bet(10)
  end

  def add_money(money)
    @bank += money
  end

  def take_cards(cards)
    @cards.concat(cards) if can_take_cards?
  end

  def score
    @score = 0
    @cards.each do |card|
      @score += if @score + card.value.max > 21
                  card.value.min
                else
                  card.value.max
                end

    end
    @score
  end

  def all_card
    all_card = ""
    @cards.each { |card| all_card = "#{all_card} #{card.face}" }
  end

  def show_player_balanse
    "#{@name} ваш баланс #{@bank}"
  end
end

protected

def can_take_cards?
  @cards.size < 3
end