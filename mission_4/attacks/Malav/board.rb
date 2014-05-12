load 'player.rb'

class Board
  def initialize
    @board_value_hash = { 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil, 7 => nil, 8 => nil, 9 => nil }
    @result_arr = [ [1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
    @player1_arr = []
    @player2_arr = []
    @player1
    @player2
    @winner
  end

  def start
    display_instructions
    create_players
    play_game
  end

private
  # Two new players are created every time when new game starts
  def create_players
    puts "Enter player1 name: "
    player1_name = gets.chomp
    @player1 = Player.new(player1_name, "X")
    puts "Enter player2 name: "
    player2_name = gets.chomp
    @player2 = Player.new(player2_name, "O")
    puts "#{@player1.name} will play with '#{@player1.symbol}' and #{@player2.name} will play with '#{@player2.symbol}' \n\n"
  end

  # Main game start from here.
  def play_game
    chance_count = 1
    @winner = nil
    display_game_board
    while chance_count < 10 do

      # If count value is odd, its player1's turn else player2's turn.
      if chance_count.odd?
        position = take_chance(@player1)
        @player1_arr.push position
      else
        position = take_chance(@player2)
        @player2_arr.push position
      end
      display_game_board
      if chance_count > 4
        if chance_count.odd?
          @winner = check_winner(@player1, @player1_arr.sort!)
          break if @winner != nil
        else
          @winner = check_winner(@player2, @player2_arr.sort!)
          break if @winner != nil
        end
      end
      chance_count += 1
    end

    if @winner != nil
      puts "#{@winner.name.capitalize} won!"
    else
      puts "Nobody won."
    end
  end
  # This will take position value from player
  # And check if the value for position is valid or is available to assign or not
  def take_chance(player)
    puts "#{player.name.capitalize}'s turn(#{player.symbol}):"
    position = gets.chomp
    player_position = position.to_i
    if is_position_valid?(position) == true 
      @board_value_hash[player_position] = player.symbol
      return player_position
    else
      puts "Enter valid position from '1-9'\n"
      take_chance(player)
    end
  end

  # Display who wins
  def check_winner(player,position_arr)
    @result_arr.each do |lucky_arr|
      # Compares two array with '&' operator
      # example: [1,3,6,8,9] & [3,8,9] => [3,8,9], use of & operator  
      if position_arr & lucky_arr == lucky_arr
        return player
      end
    end
    return nil
  end
  

  # When player enter any value, this will check if its valid value for game or not.
  def is_position_valid?(position)
    # Matching starting point as number and ending point as number and consider only one digit in Regexp condition.
    if /(^[1-9]$)/.match(position) != nil  
      # If position is already occupied by "X" or "O", can't override that position again.
      if @board_value_hash[position.to_i] == nil
        return true
      else
        puts "The position is already entered, please enter different position\n"
      end
    else
      return false
    end
  end

  # Main game board which contain value of @board_value_hash keys's value, which is defined in initialize method
  def display_game_board
    puts "   #{@board_value_hash[1]}   |   #{@board_value_hash[2]}   |   #{@board_value_hash[3]}   "
    puts "-----------------------"
    puts "   #{@board_value_hash[4]}   |   #{@board_value_hash[5]}   |   #{@board_value_hash[6]}   "
    puts "-----------------------"
    puts "   #{@board_value_hash[7]}   |   #{@board_value_hash[8]}   |   #{@board_value_hash[9]}   "
    puts "\n\n"
  end
  
  # Instruction related to game
  def display_instructions
    puts "-------------------------------"
    puts "Welcome to the TIC-TAC-TOE game"
    puts "-------------------------------\n"
    puts "\n-------------"
    puts "Instructions:"
    puts "-------------\n"
    puts "-->This is the design of main board which will display your input as X and O in each cell\n\n"
    puts "   1   |   2   |   3   "
    puts "-----------------------"
    puts "   4   |   5   |   6   "
    puts "-----------------------"
    puts "   7   |   8   |   9   "
    puts "\n\n"
    puts "--> In this table when game ask you to enter position then you have to just enter the number of that position"
    puts "--> For example if player wants to mark his/her symbol(X/O) in 5th position then just enter 5"
    puts "--- ENJOY ---\n\n"
  end
end