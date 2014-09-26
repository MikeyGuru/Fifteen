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
    puts random
    puts "Pick a number 1 or 2"
    number = gets.chomp.to_i
    if number == 1 || number == 2
      if random.include? number
        puts "You go first"
        play_player_1
      else
        puts "The computer goes first"
        play_cpu
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
  def score_cpu
    if
      @cpu_cards.inject(:+) == 15
      puts "Computer Wins"
    elsif
      @player_1.inject(:+) == 15
      puts "You Win"
    else
      cpu_pick
      score4_cpu
      user_pick
      score4_player
    end
  end
  def score_player_1
    if
      @player_1.inject(:+) == 15
      puts "You Win"
      play_again
    elsif
      @cpu_cards.inject(:+) == 15
      puts "Computer Wins"
      play_again
    else
      user_pick
      score4_player
      cpu_pick
      score4_cpu
    end
  end
  def score4_player
    p1 = @player_1.combination(3).to_a
    if sum(p1[1]) == 15
      puts "You Win"
      play_again
    elsif sum(p1[2]) == 15
      puts "You Win"
      play_again
    elsif sum(p1[3]) == 15
      puts "You Win"
      play_again
    end
  end
    def score4_cpu
      c1 = @cpu_cards.combination(3).to_a
      if sum(c1[1]) == 15
        puts "Computer Wins"
        play_again
      elsif sum(c1[2]) == 15
        puts "Computer Wins"
        play_again
      elsif sum(c1[3]) == 15
        puts "Computer Wins"
        play_again
      end
    end
  # def score5
  #   if @player_1.rotate(-4)[0] + @player_1.rotate(-4)[1] + @player_1.rotate(-4)[3] == 15
  #     puts "You Win"
  #     play_again
  #     random
  #   elsif
  #     @player_1.rotate(-3)[0] + @player_1.rotate(-3)[2] + @player_1.rotate(-3)[3] == 15
  #     puts "You Win"
  #     play_again
  #   elsif
  #     @player_1.rotate(-2)[1] + @player_1.rotate(-2)[2] + @player_1.rotate(-2)[3] == 15
  #     puts "You Win"
  #     play_again
  #   end
  # end
  def play_player_1
    user_pick
    cpu_pick
    user_pick
    cpu_pick
    user_pick
    cpu_pick
    score_player_1
  end
  def play_cpu
    cpu_pick
    user_pick
    cpu_pick
    user_pick
    cpu_pick
    user_pick
    score_cpu
  end
  def play_again
    puts "Would you like to Play Again??\nType YES or NO"
    answer = gets.chomp.downcase
    if answer == "yes"
      restart = Fifteen.new
      restart.start
    else
      exit
    end
  end

end


run = Fifteen.new
run.start
