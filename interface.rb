class Interface
  def start_game
    @game = Game.new(introduce)
    hello_player
    menu

  end

  def new_game
    game_over if @game.money_empty?
    @game.new_deck
    @game.player_clean_card
  end
  private

  def menu
    loop do
      text_menu
      puts "Ввод: "
      enter = gets.chomp.to_i
      break if enter == 2
      new_game if enter == 1
    end
  end

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

  def text_menu
    puts "Веведите 1 - Новая партия"
    puts "Веведите 2 - Выход"
  end

  def game_over
    puts "у вас на счету #{@game}"
  end
  end