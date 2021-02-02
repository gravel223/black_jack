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

  def open_cards
    @game.moneys_of_winner.money_empty?
    result_info
    more_game
  end

  def round
    @game.take_two_card_make_bet
    start_info
    step
    open_cards
  end

  def step

  end

  def choice_card
    if @game.card_limit?(@game.user)
      card_limit
    else
      @user.take_card(@game.user)
      show_info
      if @game.score_limit?(@game.user)
        open_cards
      else
        @game.dealer.step(@game.deck)
        step
      end
    end
  end

  def skip(player)
    puts "#{player.name} пропускает ход"
  end

  def menu_step
    puts "Взять карту: give | открыть карты: open | пропустить: skip"
    gets.chomp
  end

  def more_game
    puts "Сыграем еще кон? (y - да  n - нет)"
    case gets.chomp
    when 'y'
      new_game
    when 'n'
      exit
    else
      more_game
    end

  end

  def result_info
    puts "РЕЗУЛЬТАТ"
    puts "победил: #{winner_name}"
    puts "Карты диллера #{@game.dealer.all_card} очки #{@game.dealer.score}"
    puts "Карты игрока #{@game.user.all_card} очки #{@game.dealer.score}"
  end

  def start_info
    puts "______++++ Информация ++++______"
    puts "#{@game.user.score} твои очки"
    puts "#{@user.name}: #{@game.user.bank} долларов"
    puts "#{@game.dealer.name}: #{@game.dealer.bank} долларов"
    puts "Карты #{@user.name} #{@game.user.all_card}"
    puts "Карты #{@game.dealer.name} #{@game.dealer.hidden_cards}"
  end

  def winner_name
    if @game.win
      @game.win.name
    else
      "ничья"
    end
  end

  end
