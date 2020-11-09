def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Output will be:
# My string looks like this now: pumpkinsrutabega
# My array looks like this now: ["pumpkins"]

# tricky_method_two mutates the string supplied to it, but not the array.
