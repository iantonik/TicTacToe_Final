spaces = {'a1' => '', 'a2' => '', 'a3' => '', 'b1' => '', 'b2' => '', 'b3' => '', 'c1' => '', 'c2' => '', 'c3' => ''}
winning_combos = [['a1', 'a2', 'a3'], ['b1', 'b2', 'b3'], ['c1', 'c2', 'c3'],['a1', 'b1', 'c1'], ['a2', 'b2', 'c2'], ['a3', 'b3', 'c3'], ['a1', 'b2', 'c3'], ['a3', 'b2', 'c1'] ]

user_sign = 'X'
computer_sign = 'O'

def initial_board()
  puts ' a1 | a2 |  a3 '
  puts '--------------'
  puts ' b1 | b2 |  b3 '
  puts '---------------'
  puts ' c1 | c2 |  c3 '
end

def board (spaces)
  puts "  #{spaces['a1']}  |  #{spaces['a2']}  |  #{spaces['a3']}"
  puts "----+----+-----"
  puts "  #{spaces['b1']}  |  #{spaces['b2']}  |  #{spaces['b3']}"
  puts "----+----+-----"
  puts "  #{spaces['c1']}  |  #{spaces['c2']}  |  #{spaces['c3']}"
end


puts "Play Tic Tac Toe."
puts "What's your name?"

computer_name = "Joe Computer"
user_name = gets.chomp.capitalize

puts "Hi #{user_name}, my name is #{computer_name}."
puts "I will use #{computer_sign}, and you will use #{user_sign}. Let's play!"

puts "Here's our board:"
puts initial_board

end_game = false
while !end_game do

  puts "Please make your selection."
  user_choice = gets.chomp.to_s
    if spaces.has_key?(user_choice) && spaces[user_choice]==''
      spaces[user_choice] = user_sign
    else
      puts "Invalid choice!"
      redo
    end

#calculate computer move
  computer_choice = nil

  winning_combos.each do |computer_move|
    if spaces.values_at(*computer_move).count(computer_sign) == 2
      computer_option = spaces.select {|k,v| (computer_move.include?(k)) && (v == '')}.keys
      if !computer_option.nil? && computer_option.any?
        computer_choice = computer_option[0]
        break
      end
    elsif spaces.values_at(*computer_move).count(user_sign) == 2
      computer_option = spaces.select {|k,v| (computer_move.include?(k)) && (v == '')}.keys
      if !computer_option.nil? && computer_option.any?
        computer_choice = computer_option[0]
      end
    end
  end

  if (computer_choice == nil)
    computer_options = spaces.select {|k, v| v==''}.keys
    computer_choice = computer_options.sample
  end

#Do the move. Play.

  spaces[computer_choice] = computer_sign


  winning_combos.each do |winning_combo|
    if spaces.values_at(*winning_combo).count(user_sign) == 3
      puts 'You win!'
      end_game = true
    elsif spaces.values_at(*winning_combo).count(computer_sign) == 3
      puts 'Computer Wins!'
      end_game = true
    end
  end


  puts board(spaces)


  if !spaces.has_value?('')
    puts "No more moves. It's a tie."
    end_game = true
  end

end
