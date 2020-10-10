class User

  attr_reader :name, :cards, :balanse, :passed_the_move, :took_the_card, :took_the_card
  def initialize(name)
    @name = name
    @cards = []
    @balanse = START_BALANSE
    @passed_the_move = false
    @took_the_card = false
    @opened_cards = false
  end
  end

def make_bet
  @balanse - BET_AMOUNT
end

def take_money(amount)
  @balanse = amount
end

def take_cards(cards)
  @cards.concat(cards) if can_take_cards?
end

def show_cards_back
  @cards.each { printf('%4s', '*') }
  Message.double_new_line
end

def show_cards_face
  @cards.each { |card| printf('%4s', "#{card.value}#{card.suit}") }
  Message.double_new_line
end

def show_balance
  puts "#{@name}'s balance: #{@balance}"
end

def cards_limit_reached?
  @cards.size == MAX_CARDS_COUNT
end

def win(bank)
  Message.show("#{@name} win!")
  take_money(bank)
end

def clear_cards
  @cards = []
  @passed_the_move = false
  @took_the_card = false
  @opened_cards = false
end


protected

  BET_AMOUNT = 10
  START_BALANSE = 100
  MAX_CARDS_COUNT = 3

attr_writer :passed_the_move, :took_the_card, :opened_cards

def pass_move
  Message.show("#{name} пасовать ход")
  self.passed_the_move = true
end

def take_card(card)
  Message.show("#{name} взять карту.")
  take_cards(card)
  self.took_the_card = true
end

def open_cards
  Message.show("#{name} открыть карты.")
  self.opened_cards = true
end

def can_take_cards?
  @cards.size < 3
end

def can_open_cards?(command)
  command == 'o'
end

