def double_numbers!(numbers)
  counter = 0
  loop do
    break if counter == numbers.size
    numbers[counter] *= 2
    counter += 1
  end
  numbers
end

numbers = [7, -6, 14, 100, -250]
p numbers
double_numbers!(numbers)
p numbers
