require 'pry'
require_relative 'player'
require_relative 'board'

system "clear"
class Game

  #This method creates the two players
  #Call the board_card_start method
  #And create the 9 cases of the games
  def initialize
    @board_instance = Board.new
    @player_1 = Player.new("X")
    @player_2 = Player.new("O")
    puts "Welcolme #{@player_1.player_name} & #{@player_2.player_name}"
    @board_instance.board_card_start
    @board_instance.rules_of_the_game
    puts "Have you read the rules ?"
    puts "Press enter key to continue"
    gets.chomp
    system "clear"

  end

  #This method contains everything that happen
  #Each round of the game
  def round
    user_move = 0
    i = 0

    until Player.offsprings[0].winning || Player.offsprings[1].winning || i > 8
      Player.offsprings.each do |l|

        puts "\n------------------ Round number #{i+1} --------------------"

        puts l.player_name + ", it's your turn."
        puts "Where are you going to play ? [1-9]"
        user_move = gets.chomp.to_i - 1

        validation = @board_instance.sign_case(user_move)

        @board_instance.correct_input(validation, l.symbol)
        system "clear"
        @board_instance.print_table

        test_winning = @board_instance.winning(l)

        if test_winning == true

          puts "Congratulations " + l.player_name + ", you won."
          puts "\n-------------------------------------------------------"
          finished_game = true
        end



    #If this is turn 9 and nobody won break the game
    #Display ending message based on the result of the game
    if i == 8 && @player_1.winning == @player_2.winning
      puts "\n-------------------------------------------------------"
      puts "It is a square. Nobody won"
      puts "\n-------------------------------------------------------"
      finished_game = true
    end

    if finished_game == true
      puts "Game over"
      puts "\n-------------------------------------------------------"

    end
    i = i + 1
    break if finished_game == true
  end
end
end

#Method to start the game again
def play_again
  puts "Do you want to play again ?"
  puts "Press Y to continue or any other key to exit"
  user_input = gets.chomp
  if user_input == "Y"
  else
    puts "Goodbye"
  end
  user_input

end

def loop_game(instance, user_input)
  while user_input == "Y"
  Player.offsprings.each do |l|
    l.winning = false
  end
  Board_card.children.each do |tile|
    tile.status = ""
  end
  instance.round
end

end
end

#Here we create an instance of the class Game
#And launch the method round

@script = Game.new
@script.round
@script.loop_game(@script, @script.play_again)



