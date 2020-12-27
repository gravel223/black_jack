class Interface
  def start_game
    @game = Game.new(introduce)
    hello_player
    new_game
  end

  def new_game
    puts "######БЛЕКДЖЕК!######"
    game_over if @game.money_empty?
    @game.new_deck
    @game.player_clean_card
    round
  end
  private

  def introduce
    @user = User.new(ask_name)
  end

  def ask_name
    puts "Как вас зовут"
    gets.chomp
  end

  def hello_player
    puts "Привет, #{@user.name}. Добро пожаловать в блекджек!"
  end

  def game_over
    puts "Ваш счет: #{@user.bank}. Счет диллера: #{@game.dealer.bank}"
  end

  def round
    @game.take_two_card_make_bet
    start_info

  end

  def start_info
    puts "______++++ Информация ++++______"
    puts "#{@game.user.score} твои очки"
    puts "#{@user.name}: #{@game.user.bank} долларов"
    puts "#{@game.dealer.name}: #{@game.dealer.bank} долларов"
    puts "Карты #{@user.name} #{@game.user.all_card}"
    puts "Карты #{@game.dealer.name} #{@game.dealer.hidden_cards}"
  end
  end