puts "Welcome to Calculator!"
print "What's the first number?: "
first_number = gets.to_i
print "What's the second number?: "
second_number = gets.to_i

loop do
  puts "What operation would you like to perform?"
  puts "1) add 2) subtract 3) multiply 4) divide"
  operator = gets.to_i
  
  case operator
  when 1
    puts "#{first_number} + #{second_number} = #{first_number + second_number}"
    break
  when 2
    puts "#{first_number} - #{second_number} = #{first_number - second_number}"
    break
  when 3
    puts "#{first_number} * #{second_number} = #{first_number * second_number}"
    break
  when 4
    if second_number == 0
      puts "Division by 0 is undefined."
    else
      puts "#{first_number} / #{second_number} = #{first_number.to_f / second_number.to_f}"
    end
    break
  else
    puts 'Not a valid operation. Please try again.'
  end

end
