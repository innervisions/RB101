# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# input: string
# output: array of strings
# rules:
#       Explicit requirements:
#         - Each value in the outputted array is a substring of the Interrupt
#           string that forms a palindrome.
#         - The output string contains all valid palindrome substrings.
#         - - Our method is case sensitive. For example "Aba" is not a palindrome.
#       Implicit requirements:
#         - Valid substrings must be at least two characters. 'b' is not a palindrome.
#           'bb' IS a palindrome.
#         - A string with no palindrome substrings will cause our method to return an empty
#           array. This includes the case where the input is an empty string.


# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

# Data Structure: array

# Algorithm:
#    palindrome_substrings:
#     - initialize a result variable to an empty array
#     - create an array named substring_arr that contains all of the
#       substrings of the input string that are at least 2 characters long.
#     - loop through the words in the substring_arr array.
#     - if the word is a palindrome, append it to the result
#    array
#     - return the result array
#     substrings:
#     - create an empty array called `result` that will contain all required substrings
#     - create a `starting_index` variable (value `0`) for the starting index of a substring
#     - start a loop that iterates over `starting_index` from `0` to the length of the string minus 2
#     - create a `num_chars` variable (value `2`) for the length of a substring
#     - start an inner loop that iterates over `num_chars` from `2` to `string.length - starting_index`
#     - extract a substring of length `num_chars` from `string` starting at `starting_index`
#     - append the extracted substring to the `result` array
#     - increment the `num_chars` variable by `1`
#     - end the inner loop
#     - increment the `starting_index` variable by `1`
#     - end the outer loop
#     - return the `result` array
#     is_palindrome?:
#        check whether the string value is equal to its reversed value,
#        using the String#reverse method.
# ##################

def substrings(str)
  result = []
  starting_index = 0;

  while (starting_index <= str.length - 2)
    num_chars = 2
    while (num_chars <= str.length - starting_index)
      substring = str.slice(starting_index, num_chars)
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  result
end

def is_palindrome?(str)
  str == str.reverse
end  

def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end

# Tests
p palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
p palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome") == []
p palindrome_substrings("") == []
