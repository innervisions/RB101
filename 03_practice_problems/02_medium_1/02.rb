# puts "the value of 40 + 2 is " + (40 + 2)

# This causes a type error, because there is no implicit
# conversion of the result of 40 + 2, 42, into a string.

puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{40 + 2}"
# these both work!
