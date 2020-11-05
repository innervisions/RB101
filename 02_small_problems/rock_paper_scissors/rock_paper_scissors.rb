VALID_CHOICES = %w[rock paper scissors]

def prompt(message)
  puts "=> #{message}"
end

def get_choice
  choice = nil
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp.downcase
    break if VALID_CHOICES.include?(choice)
    prompt("That's not a valid choice.")
  end
  choice
end

def get_computer_choice
  VALID_CHOICES.sample
end

def win?(first_player, second_player)
  (first_player == 'rock' && second_player == 'scissors') ||
    (first_player == 'scissors' && second_player == 'paper') ||
    (first_player == 'paper'    && second_player == 'rock')
end

def display_result(choice, computer_choice)
  prompt("User chose #{choice}. Computer chose #{computer_choice}.")
  if win?(choice, computer_choice)
    prompt("You won!")
  elsif win?(computer_choice, choice)
    prompt("Computer won.")
  else
    prompt("It's a tie.")
  end
end

def play_again?
  loop do
    prompt("Would you like to play again? (Y/N)")
    input = gets.chomp.upcase
    return true if %w(YES Y).include?(input)
    return false if %w(NO N).include?(input)
  end
end
# ####MAIN#########
loop do
  choice = get_choice
  computer_choice = get_computer_choice
  display_result(choice, computer_choice)
  break unless play_again?
end
prompt("Thank you for playing!")
