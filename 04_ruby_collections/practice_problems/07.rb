statement = "The Flintstones Rock"
letter_count = Hash.new(0)
statement.each_char do |char|
  letter_count[char] += 1 if /[\w]/.match(char)
end
p letter_count
