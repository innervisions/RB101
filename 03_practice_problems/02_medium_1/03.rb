def factors(number)
  factors = []
  (1..number).each do |divisor|
    factors << number / divisor if number % divisor == 0
  end
  factors.reverse # for array sorted by increasing values
end

# Bonus 1 - What is the purpose of the number % divisor == 0 ?

# This statement is there because in order for a number to be a
# factor, it must divide evenly. If x is a factor of y,
# then x % y == 0.

# Bonus 2 - What is the purpose of the second-to-last line (line 8)
# in the method (the factors before the method's end)?

# A method returns the return value of the last line evaluated.
# This causes the factors method to return the array of factors.
