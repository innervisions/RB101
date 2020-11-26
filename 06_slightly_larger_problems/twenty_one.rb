SUITS = %w(♠ ♣ ♥ ♦)
RANKS = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
CEILING = 21
WINS_REQUIRED = 5

def clear_screen
  system('clear') || system('clr')
end

def prompt(msg)
  puts "=> #{msg}"
end

def point_value(rank)
  if rank == 'A'
    11
  elsif rank.to_i == 0
    10
  else
    rank.to_i
  end
end

def initialize_deck
  SUITS.each_with_object([]) do |suit, deck|
    RANKS.each do |rank|
      deck << { suit: suit, rank: rank, points: point_value(rank) }
    end
  end.shuffle
end

def joinand(arr)
  case arr.size
  when 1 then arr[0].to_s
  when 2 then "#{arr[0]} and #{arr[1]}"
  else
    arr[0..-2].join(', ') + ", and #{arr[-1]}"
  end
end

def format_hand(hand)
  joinand(hand.map { |card| "#{card[:rank]} #{card[:suit]}" })
end

def display_banner(round, scores)
  clear_screen
  puts 'Twenty-One'
  puts '*' * 11
  puts "Round #{round}\n"
  puts "Player: #{scores[:player]} Dealer: #{scores[:dealer]}"
  puts "Win #{WINS_REQUIRED} hands to win the match."
  puts '-' * 35
  puts
end

def display_hands(player_hand, dealer_hand, round,
                  scores, hole_hidden = false)

  display_banner(round, scores)
  if hole_hidden
    puts "Dealer has #{dealer_hand[0][:rank]} #{dealer_hand[0][:suit]}" \
      " and an unknown card."
  else
    puts "Dealer has #{format_hand(dealer_hand)}. " \
      "(Total: #{total(dealer_hand)})"
  end
  puts "You have #{format_hand(player_hand)}. " \
    "(Total: #{total(player_hand)})"
  puts '-' * 35
end

def player_choice
  loop do
    prompt 'Would you like to hit or stay?:'
    choice = gets.chomp.downcase
    unless choice.empty?
      return 'hit' if 'hit'.start_with?(choice)
      return 'stay' if 'stay'.start_with?(choice)
    end
    prompt "That's not a valid choice."
  end
end

def total(hand)
  hand_points = hand.map { |card| card[:points] }
  sum = hand_points.sum
  hand_points.count(11).times { sum -= 10 if sum > CEILING }
  # counts the number of Aces (11 points)
  sum
end

def bust?(hand)
  total(hand) > CEILING
end

def result(player_hand, dealer_hand)
  case total(player_hand) <=> total(dealer_hand)
  when 1 then :player
  when -1 then :dealer
  else :push
  end
end

def announce_winner(winner)
  case winner
  when :player then 'You win!'
  when :dealer then 'Dealer wins.'
  else              "It's a push."
  end
end

def display_result(player_hand, dealer_hand, winner)
  prompt "Dealer's hand is worth #{total(dealer_hand)}."
  prompt "Your hand is worth #{total(player_hand)}."
  prompt announce_winner(winner)
end

def update_scores(scores, winner)
  scores[winner] += 1 if [:player, :dealer].include?(winner)
end

def play_again?
  loop do
    prompt 'Would you like to play again? (y/n):'
    input = gets.chomp.downcase
    unless input.empty?
      return true if input.start_with?('y')
      return false if input.start_with?('n')
    end
  end
end

def player_turn(deck, player_hand, dealer_hand, round, scores)
  loop do
    display_hands(player_hand, dealer_hand, round, scores, true)
    choice = player_choice
    break if choice == 'stay'
    player_hand << deck.pop
    break if bust?(player_hand)
  end
  display_hands(player_hand, dealer_hand, round, scores, true)
end

def dealer_turn(deck, player_hand, dealer_hand, round, scores)
  until total(dealer_hand) >= 17
    dealer_hand << deck.pop
  end
  display_hands(player_hand, dealer_hand, round, scores)
end

# rubocop:disable Metrics/MethodLength
def play_round(round, scores)
  deck = initialize_deck
  player_hand = [deck.pop, deck.pop]
  dealer_hand = [deck.pop, deck.pop]
  player_turn(deck, player_hand, dealer_hand, round, scores)
  if bust?(player_hand)
    prompt "You bust! Dealer wins."
    update_scores(scores, :dealer)
  else
    dealer_turn(deck, player_hand, dealer_hand, round, scores)
    if bust?(dealer_hand)
      prompt 'Dealer busts! You win!'
      update_scores(scores, :player)
    else
      winner = result(player_hand, dealer_hand)
      display_result(player_hand, dealer_hand, winner)
      update_scores(scores, winner)
    end
  end
end
# rubocop:enable Metrics/MethodLength

def play_match
  scores = { player: 0, dealer: 0 }
  round = 1
  loop do
    play_round(round, scores)
    break if scores.values.include?(WINS_REQUIRED)
    round += 1
    puts "\nPress ENTER to continue."
    gets
  end
  prompt "Player has won #{scores[:player]}. " \
        "Dealer has won #{scores[:dealer]}."
  prompt "#{scores.key(WINS_REQUIRED).to_s.capitalize} wins the match!"
  puts
end
# MAIN #####
loop do
  play_match
  break unless play_again?
end
prompt 'Thank you for playing Twenty-One!'
