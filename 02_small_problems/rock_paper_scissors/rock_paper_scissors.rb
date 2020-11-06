MATCHUPS = {
  'rock' => %w(scissors lizard),
  'paper' => %w(rock spock),
  'scissors' => %w(paper lizard),
  'spock' => %w(rock scissors),
  'lizard' => %w(spock paper)
}
VALID_CHOICES = %w(rock paper scissors lizard spock)
VALID_ABBREVIATIONS = %w(r p sc l sp)
WINS_REQUIRED = 5

def prompt(message)
  puts "=> #{message}"
end

def clear_screen
  system('clr') || system('clear')
end

def display_banner
  puts '-' * 50
  puts 'Rock Paper Scissors Lizard Spock'
  puts '-' * 50
end

def get_name
  name = ''
  loop do
    prompt('What is your name?')
    name = gets.chomp
    break if name.length > 0
  end
  name
end

def valid_choice(choice)
  VALID_ABBREVIATIONS.each do |abbreviation|
    return true if choice.start_with?(abbreviation)
  end
  false
end

def unabbrevriate(choice)
  VALID_ABBREVIATIONS.each_with_index do |abbreviation, idx|
    return VALID_CHOICES[idx] if choice.start_with?(abbreviation)
  end
end

def get_choice
  choice = nil
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp.downcase
    break if valid_choice(choice)
    prompt("That's not a valid choice.")
  end
  unabbrevriate(choice)
end

def get_computer_choice
  VALID_CHOICES.sample
end

def win?(first_player, second_player)
  MATCHUPS[first_player].include?(second_player)
end

def display_round(round)
  puts '*' * 10
  puts "Round #{round}"
  puts '*' * 10
end

def display_round_result(name, choice, computer_choice, winner)
  prompt("#{name} chose #{choice}. Computer chose #{computer_choice}.")
  if winner
    prompt("#{winner} won.")
  else
    prompt("It's a tie.")
  end
end

def play_round(name, round, scores)
  display_round(round)
  choice = get_choice
  computer_choice = get_computer_choice
  winner = nil

  if win?(choice, computer_choice)
    scores[:player] += 1
    winner = name
  end
  if win?(computer_choice, choice)
    scores[:computer] += 1
    winner = 'Computer'
  end
  display_round_result(name, choice, computer_choice, winner)
end

def display_match_result(name, grand_winner, scores)
  puts '*' * 20
  prompt("#{name} won #{scores[:player]}.")
  prompt("Computer won #{scores[:computer]}.")
  prompt("#{grand_winner} wins the match!")
end

def play_match(name)
  scores = { player: 0, computer: 0 }
  round = 1
  grand_winner = nil

  until grand_winner
    play_round(name, round, scores)
    grand_winner = name if scores[:player] == WINS_REQUIRED
    grand_winner = 'Computer' if scores[:computer] == WINS_REQUIRED
    round += 1
  end
  display_match_result(name, grand_winner, scores)
end

def play_again?
  loop do
    prompt("Would you like to play again? (Y/N)")
    input = gets.chomp.upcase
    return true if %w(YES Y).include?(input)
    return false if %w(NO N).include?(input)
  end
end

def display_goodbye(name)
  prompt("Thank you for playing, #{name}!")
end
# MAIN #############
clear_screen
display_banner
name = get_name
loop do
  play_match(name)
  break unless play_again?
  clear_screen
  display_banner
end
display_goodbye(name)
