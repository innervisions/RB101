# Describe the difference between ! and ? in Ruby. And explain what would happen
# in the following scenarios:

# ! is the negation operator. It returns false on a truthy statement and true
# on a falsey one.
# It's also used in method names that mutate the object calling the method. This
# is a convention, not a langauge feature.

# ? is used as the ternary operator. It evaluates the truthiness of a condition,
# and provides for options to execute based on the evaluated truthiness.
# ? can also be seen in method names for methods that return true or false. This
# is a convention, not a language feature.

# 1) what is != and where should you use it?
# != means "not equal to" and is used for comparisons.

# 2) put ! before something, like !user_name
# ! Negates the truthiness of the thing it's operating on.

# 3) put ! after something, like words.uniq!
# By convention this is a method that mutates it's caller.

# 4) put ? before something
# ? comes before the two possible paths when used as the ternary operator.

# 5) put ? after something
# By convention this is a method that returns true or false.

# 6)put !! before something, like !!user_name
# !! returns true when operating on a falsey statement, and false when
# on a truthy one.
