def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  number.to_i != 0
end

def operation_to_message(operation)
  case operation
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

name = ''
loop do
  prompt 'Welcome to Calculator! Please enter your name.'
  name = gets.chomp
  name.empty? ? prompt('Not a valid name.') : break
end

loop do
  first_number, second_number = nil
  loop do
    prompt("What's the first number?:")
    first_number = gets.chomp
    if valid_number?(first_number)
      break
    else
      prompt('That doesn\'t look like a valid integer.')
    end
  end

  loop do
    prompt("What's the second number?: ")
    second_number = gets.chomp
    if valid_number?(second_number)
      break
    else
      prompt('That doesn\'t look like a valid integer.')
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) Add
    2) Subtract
    3) Multiply
    4) Divide
  MSG
  prompt(operator_prompt)
  operator = nil
  loop do
    operator = gets.chomp
    if %w[1 2 3 4].include?(operator)
      break
    else
      prompt('Must choose 1, 2, 3, or 4.')
    end
  end
  prompt("#{operation_to_message(operator)} the two numbers...")
  result = case operator
           when '1'
             first_number.to_i + second_number.to_i
           when '2'
             first_number.to_i - second_number.to_i
           when '3'
             first_number.to_i * second_number.to_i
           when '4'
             first_number.to_f / second_number.to_i
           end
  prompt("The result is #{result}.")
  prompt('Would you like to perform another calculation?
   (Y to calculate again)')
  break unless gets.chomp.downcase.start_with?('y')

  prompt('Thank you for using the calculator! Bye bye.')
end
