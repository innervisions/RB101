# Ben's Code ##############
# limit = 15

# def fib(first_num, second_num)
#   while first_num + second_num < limit
#     sum = first_num + second_num
#     first_num = second_num
#     second_num = sum
#   end
#   sum
# end

# result = fib(0, 1)
# puts "result is #{result}"

# ########

# The issue with Ben's code is that a method is a self-contained
# variable scope. The fib method cannout access the limit variable
# defined outside of its scope.
# In order to fix this, we can define limit as a constant, or we can
# make it an argument for our method, as demonstrated below.

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, 15)
puts "result is #{result}"
