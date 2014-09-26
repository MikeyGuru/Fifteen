class Player
  attr_accessor :name

  def ask_name
    puts "Please enter your name"
    @name = gets.chomp
  end
end

first_player = Player.new
first_player.ask_name
first_player.name

class Fifteen
  attr_accessor :player_name

  def initialize
    @cards = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @cpu_cards = []
    @player_1 = []
    @player_2 = []
  end
  def start
    welcome
  end
  def random_start
    random
  end
  def random
    random = Array.new
    random << rand(1..2)
    puts random
    puts "Pick a number 1 or 2"
    number = gets.chomp.to_i
    if number == 1 || number == 2
      if random.include? number
        puts "You go first"
      else
        puts "The computer goes first"
      end
    else
      puts "Please pick a number 1 or 2"
      random_start
    end
  end
  def welcome
    puts ".....Welcome to GURU's FIFTEEN....\nWould you like to know how to play?"
    help = gets.chomp.downcase
    if help == "yes"
      puts "Rules and Info"
    elsif help == "no"
      puts "\nLet's PLAY Fifteen\n"
    else
      puts 'INVALID RESPONSE PLEASE ENTER "YES" OR "NO"' + "\n" + "\n"
      start
    end
  end
  def cpu_pick
    pick = @cards.sample
    @cpu_cards << pick
    @cards.delete(pick)
    puts "The Computer has picked #{@cpu_cards}"
  end
  def user_pick
    puts "Pick a number here's what's left: #{@cards} "
    pick = gets.chomp.to_i
    if @cards.include? pick
      @player_1 << pick
      @cards.delete(pick)
      puts"#{@player_name} you picked #{@player_1}"
    else
      puts "Please pick a valid number"
      user_pick
    end
  end
  def score
    if
      @player_1.inject(:+) == 15
      puts "You Win"
    elsif
      @cpu_cards.inject(:+) == 15
      puts "Computer Wins"
    else
      user_pick
      score4_player
      cpu_pick
      score4_cpu
    end
  end
  def score4_player
    if @player_1[0] + @player_1[1] + @player_1[3] == 15
      puts "You Win"
    elsif
      @player_1[0] + @player_1[2] + @player_1[3] == 15
      puts "You Win"
    elsif
      @player_1[1] + @player_1[2] + @player_1[3] == 15
      puts "You Win"
    else
      exit
    end
  end
  def score4_cpu
    if
      @cpu_cards[0] + @cpu_cards[1] + @cpu_cards[3]  == 15
      puts "Computer Wins"
    elsif
      @cpu_cards[0] + @cpu_cards[2] + @cpu_cards[3] == 15
      puts "Computer Wins"
    elsif
      @cpu_cards[1] + @cpu_cards[2] + @cpu_cards[3]  == 15
      puts "Computer Wins"
    else
    exit
    end
  end
  def play
    start
    random
    user_pick
    cpu_pick
    user_pick
    cpu_pick
    user_pick
    cpu_pick
    score
  end


  # def score
  #   count_thresh = 2
  #   count = 0
  #   loop do
  #     user_pick
  #     cpu_pick
  #     count += 1
  #     break if count > count_thresh || @player_1[0] + @player_1[1] + @player_1[2] ==15
  #
  #   end
  # end
end


run = Fifteen.new
run.play