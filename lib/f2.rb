class Player
  attr_accessor :name

  def ask_name
    puts "Please enter your name"
    @name = gets.chomp.capitalize
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
  def sum(array)
    array.inject{|sum,x| sum + x }
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
    puts "\n#{@player_name} Pick a number 1 or 2"
    number = gets.chomp.to_i
    if number == 1 || number == 2
      if random.include? number
        puts "#{@player_name} you go first"
        play_player_1
      else
        puts "The computer goes first"
        play_cpu
      end
    else
      puts "#{@player_name}, Please pick a number 1 or 2"
      random_start
    end
  end
  def welcome
    puts ".....Welcome to GURU's FIFTEEN....\nWould you like to know how to play?"
    help = gets.chomp.downcase
    if help == "yes"
      puts "Rules and Info\n
Decide who goes first.

Each player, on his or her turn, selects one of the numbers. You can't choose a number that's already been chosen.

To win, you must select three numbers that add up to 15.

If all the numbers are chosen, and nobody has a set of three that add up to 15, the game is a draw.\n\n"
      puts "\nOkay Lets play when your ready\n"
      random_start
    elsif help == "no"
      puts "\nLet's PLAY Fifteen\n"
      random_start
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
    puts "#{@player_name} Pick a number here's what's left: #{@cards} "
    pick = gets.chomp.to_i
    if @cards.include? pick
      @player_1 << pick
      @cards.delete(pick)
      puts"#{@player_name} you picked #{@player_1}"
    else
      puts "Please pick a valid number #{@player_name}"
      user_pick
    end
  end
  def score_player_1
    p1 = @player_1.combination(3).to_a
    if p1.any?{ |array| sum(array) == 15 }
      puts "#{@player_name} You Win"
      play_again
    else
    end
  end
  def score_cpu
    c1 = @cpu_cards.combination(3).to_a
    if c1.any?{ |array| sum(array) == 15 }
      puts "Computer Wins"
      play_again
    else
    end
  end
  def play_player_1
    user_pick
    cpu_pick
    user_pick
    cpu_pick
    user_pick
    score_player_1
    cpu_pick
    score_cpu
    user_pick
    score_player_1
    cpu_pick
    score_cpu
    user_pick
    score_player_1
    if @cards.to_a.empty?
      puts "Gameover\n It's a TIE"
      play_again
    end
  end
  def play_cpu
    cpu_pick
    user_pick
    cpu_pick
    user_pick
    cpu_pick
    score_cpu
    user_pick
    score_player_1
    cpu_pick
    score_cpu
    user_pick
    score_player_1
    cpu_pick
    score_cpu
    if @cards.to_a.empty?
      puts "Gameover\n It's a TIE"
      play_again
    end
  end
  def play_again
    puts "#{@player_name} would you like to Play Again??\nType YES or NO"
    answer = gets.chomp.downcase
    if answer == "yes"
      restart = Fifteen.new
      restart.start
    elsif answer == "no"
      puts "Thanks for playing #{@player_name}"
      exit
    else
      puts "#{@player_name} Enter YES or NO"
      play_again
    end
  end

end
run = Fifteen.new
run.player_name=(first_player.name)
run.start
