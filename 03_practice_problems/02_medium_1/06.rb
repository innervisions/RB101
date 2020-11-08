answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# The output will be 34. mess_with it does NOT mutate the ineger passed to it.
# We stored the return value in new_answer, but we are printing the original
# answer.
