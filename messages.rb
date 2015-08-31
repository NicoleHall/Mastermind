require './gameflow'

class Messages

  def welcome
    "WELCOME TO MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit\n"
  end

  def instructions
    "The Matermind has generated a beginner sequence with four elements made up of:\n(r)ed,(g)reen, (b)lue, and (y)ellow.\nplease enter a guess in the form of 'rrgb'.\nthe Masermind will tell you which elements are correct and which positions are correct.\nYou can then guess again.\nUse (q)uit to quit the game\n"
  end

  def game_start
    "The secret code has been generated! press enter"
  end

  def prompt_guess
    "Please enter your guess in this format 'rgyb':"
  end

  def win_prompt
    "Good job.  You won"
  end

  def bad_input_error
    "You are dumb.  Give me something to work with here"
  end

  def cheat(secret_code)
    "The secret code is #{secret_code}"
  end

  def quit
    "Exiting game\n"
  end

end
