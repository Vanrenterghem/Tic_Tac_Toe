require_relative 'board_card'
require 'pry'

class Board

#We define the 9 cases of the board here
#There is also an array called @board that contains the 9 instances of the board
def board_card_start
  up_left = Board_card.new
  up_center = Board_card.new
  up_right = Board_card.new
  middle_left = Board_card.new
  middle_center = Board_card.new
  middle_right = Board_card.new
  down_left = Board_card.new
  down_center = Board_card.new
  down_right = Board_card.new

  @board = [up_left,up_center,
    up_right,
    middle_left,
    middle_center,
    middle_right,
    down_left,
    down_center,
    down_right]
  end


#This method aims at keeping the user of inputing string
#or number that are not between 1 or 9
def sign_case(user_move)

  input = [0, 1, 2, 3, 4, 5, 6 ,7, 8]
  first_loop = false
  second_loop = false
  until first_loop && second_loop
    until input.include? user_move
      puts "Not correct"
      puts "Try again"
      user_move = gets.chomp.to_i - 1
    end
    first_loop = true
    until  @board[user_move].status == ""
      puts "Not correct"
      puts "Try again"
      user_move = gets.chomp.to_i - 1
    end
    second_loop = true
  end

  user_move
end

#Put the player's sign on the designated case
def correct_input(user_move, user_symbol)

  @board[user_move].status = user_symbol

end

#This method print the board game
def print_table

  puts ""
  puts "                  " + @board[0].status + " | " + @board[1].status + " | " +  @board[2].status
  puts "                 -------------"
  puts "                  " + @board[3].status + " | " + @board[4].status + " | " +  @board[5].status
  puts "                 -------------"
  puts "                  " + @board[6].status + " | " + @board[7].status + " | " +  @board[8].status
  puts ""
end

#This methods assess if a specific player won
def winning(player)

  wins_scenario = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],  # <-- Horizontal wins
      [0, 3, 6], [1, 4, 7], [2, 5, 8],  # <-- Vertical wins
      [0, 4, 8], [2, 4, 6],             # <-- Diagonal wins
    ]

    wins_scenario.each do |scenario|
      sum = 0
      scenario.each do |tile|

        if @board[tile].status == player.symbol
          sum += 1
          if sum == 3

            player.winning = true
            return player.winning
            break
          else
            player.winning = false
          end
        end
      end
    end

  end

#the rules of the game
  def rules_of_the_game
    @board_num = ["1","2","3","4","5","6","7","8", "9"]

    puts ""
    puts ""
    puts "Here is the board and the index of each case"

    puts ""
    puts "                              #{@board_num[0]} | #{@board_num[1]} | #{@board_num[2]}"
    puts "                              ---------"
    puts "                              #{@board_num[3]} | #{@board_num[4]} | #{@board_num[5]}"
    puts "                              ---------"
    puts "                              #{@board_num[6]} | #{@board_num[7]} | #{@board_num[8]}"
    puts ""
    puts "Each turn, either of you will have to specify where you want to play."
    puts "The first one to have 3 symbols aligned win."
    puts "Have fun !"
  end
end


