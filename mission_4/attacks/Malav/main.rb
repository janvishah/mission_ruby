load 'board.rb'

begin
  board = Board.new
  board.start
  puts "Play again!!?? (y/n)"
  play_again = gets.chomp
end while play_again != "n"

puts "Thanks for playing!!"