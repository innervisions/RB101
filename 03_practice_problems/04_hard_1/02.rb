greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings
# Will output {:a =>"hi there"}
# greetings still refers to the hash, but the value at :a
# has been modified by informal_greeting << , as informal_greeting
# points to the same string object.
