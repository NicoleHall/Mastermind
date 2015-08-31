class Validator

  def initialize
    @valid_colors = ['y','g','b','r']
  end

  def validate(choice)
    if choice.length == 1
      if choice == "q" || choice == "i" || choice == "c"
        true
      else
        false
      end
    else
      valid_guess?(guess)
    end
  end


  def valid_guess?(guess)
    valid = true
    if guess.length == 4
      guess.chars.each do |color|
        if @valid_colors.include(color) == false
          valid = false
        end
      end
    else
      valid = false
    end
    valid
  end


end
