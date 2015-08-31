require './gameflow'
require './messages'
require './validator'
require './win_checker'

message = Messages.new

puts message.welcome
choice = $stdin.gets.chomp.downcase

if choice == 'p'
  puts message.game_start
  flow = Gameflow.new
  secret_code = flow.secret_code
  v = Validator.new
  puts message.prompt_guess
  guess = $stdin.gets.chomp.downcase
  win_checker = WinChecker.new
  guess_result = flow.processed_guess(guess)
  while win_checker.did_i_win(guess_result) == false do
    if guess.length == 4
      if win_checker.did_i_win(guess_result)
        message.win_prompt
      else
        puts "#{guess} has #{guess_result[0]} of the correct elements with #{guess_result[1]} in the correct positions. try again"
        guess = $stdin.gets.chomp.downcase
        guess_result = flow.processed_guess(guess)
      end
    elsif guess == "c"
      puts message.cheat(secret_code)
      guess = $stdin.gets.chomp.downcase
      guess_result = flow.processed_guess(guess)
    else
      puts "guess again.  Your guess needs to be 4 characters"
      guess = $stdin.gets.chomp.downcase
      guess_result = flow.processed_guess(guess)
    end
  end

  if win_checker.did_i_win(guess_result) == true
    puts message.win_prompt
  end

elsif choice == "q"
  print message.quit

elsif choice == "i"
  print message.instructions

else
  print "invalid choice.  Try i, q, or p\n  run the program again\n"
end
