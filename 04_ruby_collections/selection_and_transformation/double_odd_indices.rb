def double_odd_indeces(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

numbers = [7, -6, 14, 100, -250]
p numbers
p double_odd_indeces(numbers)
