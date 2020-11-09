def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)
# This time gsub! mutates all 3 strings.

puts "one is: #{one}" # "one is: two"
puts "two is: #{two}" # "two is: three"
puts "three is: #{three}" # "three is: one"
