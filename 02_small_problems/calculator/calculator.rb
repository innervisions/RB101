require 'yaml'
MESSAGES = YAML.load_file('messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def integer?(input)
  /^-?\d+$/.match(input)
end

def float?(input)
  /\d/.match(input) && /^-?\d*\.?\d*$/.match(input)
end

def valid_number?(number)
  integer?(number) || float?(number)
end

def operation_to_message(operation)
  result = case operation
           when '1'
             'Adding'
           when '2'
             'Subtracting'
           when '3'
             'Multiplying'
           when '4'
             'Dividing'
           end
  result
end

name = ''
loop do
  prompt(MESSAGES['welcome'])
  name = gets.chomp
  name.empty? ? prompt(MESSAGES[:invalid_name]) : break
end
prompt("Hello #{name}!")
loop do
  first_number, second_number = nil
  loop do
    prompt(MESSAGES['first_number'])
    first_number = gets.chomp
    if valid_number?(first_number)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  loop do
    prompt(MESSAGES['second_number'])
    second_number = gets.chomp
    if valid_number?(second_number)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  prompt(MESSAGES['operator_prompt'])
  operator = nil
  loop do
    operator = gets.chomp
    if %w[1 2 3 4].include?(operator)
      break
    else
      prompt(MESSAGES['invalid_operator'])
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
             first_number.to_f / second_number.to_f
           end
  prompt("The result is #{result}.")
  prompt(MESSAGES['another_calculation'])
  break unless gets.chomp.downcase.start_with?('y')
end
prompt(MESSAGES['thank_you'])
