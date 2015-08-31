require './messages'
require 'Pry'
class Gameflow
  attr_accessor = :secret_code, :guess

  def initialize
    @secret_code = build_secret_code
    @guess = $stdin.gets.chomp
    @start_time = Time.now
  end

  def secret_code
    @secret_code
  end

  def build_secret_code
    @secret_code = [
      "b", "b", "b", "b",
      "g", "g", "g", "g",
      "r", "r", "r", "r",
      "y", "y", "y", "y"
    ].sample(4)

  end

  def correct_position(guess)
    true_false_positions = @secret_code.zip(guess.split("")).map do |s, g|
      s == g
    end

    true_counter = 0
    true_false_positions.each do |e|
      true_counter += 1 if e == true
    end
    true_counter
  end

  def correct_color(guess)
    code_and_guess_zipped = secret_code.zip(guess.split(""))
    amount_of_correct_colors = []
    code_and_guess_zipped.each do |e|
      amount_of_correct_colors << e if e[0] == e[1]
       end
      amount_of_correct_colors.length
  end

  def processed_guess(guess)
    result = [correct_color(guess), correct_position(guess)]
  #   if result == [4, 4]
  #     #the game was won
  #   else
  #   "#{guess} has #{result[0]} of the correct elements with #{result[1]} in the correct positions.\n"
  #  end
  end
end
