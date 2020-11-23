SUITS = %w(S C H D)
RANKS = %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King)

def clear_screen
  system('clear') || system('clr')
end

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.each_with_object([]) do |suit, deck|
    RANKS.each do |rank|
      deck << { suit: suit, rank: rank }
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

def ranks(cards) # takes array of cards, returns array of ranks
  cards.map { |card| card[:rank] }
end

def display_hands(player_hand, dealer_hand, hole_hidden = false)
  clear_screen
  puts 'Twenty-One'
  puts '*' * 11
  dealer_ranks = ranks(dealer_hand)
  player_ranks = ranks(player_hand)
  if hole_hidden
    puts "Dealer has #{dealer_ranks[0]} and an unknown card."
  else
    puts "Dealer has #{joinand(dealer_ranks)}. (Total: #{total(dealer_hand)})"
  end
  puts "You have #{joinand(player_ranks)}. (Total: #{total(player_hand)})"
  puts '-' * 35
end

def player_choice
  loop do
    prompt 'Would you like to hit or stay?:'
    choice = gets.chomp.downcase
    return 'hit' if 'hit'.start_with?(choice)
    return 'stay' if 'stay'.start_with?(choice)
    prompt "That's not a valid choice."
  end
end

def total(hand)
  hand_ranks = ranks(hand)
  sum = 0
  hand_ranks.each do |rank|
    sum += if rank == 'Ace'
             11
           elsif rank.to_i == 0
             10
           else
             rank.to_i
           end
  end
  hand_ranks.count('Ace').times { sum -= 10 if sum > 21 }
  sum
end

def bust?(hand)
  total(hand) > 21
end

def result(player_hand, dealer_hand)
  case total(player_hand) <=> total(dealer_hand)
  when 1 then "You win!"
  when -1 then "Dealer wins."
  else "It's a push."
  end
end

def display_result(player_hand, dealer_hand)
  prompt "Dealer's hand is worth #{total(dealer_hand)}."
  prompt "Your hand is worth #{total(player_hand)}."
  prompt result(player_hand, dealer_hand)
end
# MAIN #####
loop do
  deck = initialize_deck
  player_hand = [deck.pop, deck.pop]
  dealer_hand = [deck.pop, deck.pop]

  loop do # Player Turn
    display_hands(player_hand, dealer_hand, true)
    choice = player_choice
    break if choice == 'stay'
    player_hand << deck.pop
    break if bust?(player_hand)
  end

  if bust?(player_hand)
    display_hands(player_hand, dealer_hand, true)
    prompt "You bust! Dealer wins."
  else
    loop do # If player didn't bust, dealer takes turn.
      display_hands(player_hand, dealer_hand)
      break if total(dealer_hand) >= 17
      dealer_hand << deck.pop
    end
    if bust?(dealer_hand)
      prompt 'Dealer busts! You win!'
    else
      display_result(player_hand, dealer_hand)
    end
  end
  prompt 'Would you like to play again? (y/n):'
  break unless gets.chomp.downcase.start_with?('y')
end
prompt 'Thank you for playing Twenty-One!'
