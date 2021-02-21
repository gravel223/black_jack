class Interface
  def start_game
    @game = Game.new(ask_name)
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

  def ask_name
    puts "Как вас зовут"
    gets.chomp
  end

  def hello_player
    puts "Привет, #{@game.user.name}. Добро пожаловать в блекджек!"
  end

  def game_over
    puts "Ваш счет: #{@game.user.bank}. Счет диллера: #{@game.dealer.bank}"
  end

  def open_cards
    @game.moneys_of_winner
    @game.money_empty?
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
    card_limit if @game.card_limit?(@game.user)
    case menu_step
      when 'give'
        choice_card
      when 'open'
        open_cards
      when 'skip'
        skip(@game.user)
        dealer_step
        step
    end
  end

  def dealer_step
    card = @game.dealer.step(@game.deck)
    if card
      puts "Дилер взял карту #{card.face}"
    else
      puts "Дилер пропустил ход"
    end
  end

  def choice_card
    dealer_step
    card = @game.user.take_card(@game.deck)
    puts "Игрок взял карту #{card.face}"
    start_info
    if @game.score_limit?(@game.user)
        open_cards
      else
        step
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
    puts "Карты игрока #{@game.user.all_card} очки #{@game.user.score}"
    puts "#{@game.user.name}: #{@game.user.bank} долларов"
    puts "#{@game.dealer.name}: #{@game.dealer.bank} долларов"
  end

  def start_info
    puts "______++++ Информация ++++______"
    puts "#{@game.user.score} твои очки"
    puts "#{@game.user.name}: #{@game.user.bank} долларов"
    puts "#{@game.dealer.name}: #{@game.dealer.bank} долларов"
    puts "Карты #{@game.user.name} #{@game.user.all_card}"
    puts "Карты #{@game.dealer.name} #{@game.dealer.hidden_cards}"
  end

  def winner_name
    if @game.win
      @game.win.name
    else
      "ничья"
    end
  end

  def card_limit
    puts 'Достигнут лимит карт! Игра окончена!'
    open_cards
  end

 end
