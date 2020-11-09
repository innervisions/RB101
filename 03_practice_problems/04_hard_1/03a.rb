def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three) # does not mutate strings

puts "one is: #{one}" # "one: is one"
puts "two is: #{two}" # "two: is two"
puts "three is: #{three}" # "three: is three"
