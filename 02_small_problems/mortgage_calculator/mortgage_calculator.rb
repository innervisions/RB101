require 'yaml'
MESSAGES = YAML.load_file('messages.yml')

def prompt(message, pre = '')
  puts "=> #{pre}#{message}"
end

def clear_screen
  system('clr') || system('clear')
end

def display_welcome
  prompt(MESSAGES['welcome'])
end

def valid_amount?(input)
  (/\A\d+\z/.match(input) || /\A\d+.\d{2}\z/.match(input)) && input.to_f > 0.0
end

def get_amount
  loan_amount = nil
  loop do
    prompt(MESSAGES['get_amount'])
    loan_amount = gets.chomp
    break if valid_amount?(loan_amount)
    prompt(MESSAGES['invalid_amount'])
  end
  loan_amount
end

def valid_apr?(input)
  (/\A\d+\z/.match(input) || /\A\d+.\d+\z/.match(input)) && input.to_f > 0.0
end

def get_apr
  apr = nil
  loop do
    prompt(MESSAGES['get_apr'])
    apr = gets.chomp
    break if valid_apr?(apr)
    prompt(MESSAGES['invalid_apr'])
  end
  apr
end

def valid_years?(input)
  /\A\d+\z/.match(input)
end

def get_years
  years = nil
  loop do
    prompt(MESSAGES['get_years'])
    years = gets.chomp
    break if valid_years?(years)
    prompt(MESSAGES['invalid_years'])
  end
  years
end

def valid_months?(input)
  /\A\d+\z/.match(input) && (0..11).include?(input.to_i)
end

def get_excess_months(years)
  months = nil
  loop do
    if years.to_i == 1
      prompt(MESSAGES['get_months_one_year'])
    else
      prompt(MESSAGES['get_months'], years)
    end
    months = gets.chomp
    break if valid_months?(months)
    prompt(MESSAGES['invalid_months'])
  end
  months
end

def get_duration_in_months
  years = get_years
  months = get_excess_months(years)
  (years.to_i * 12) + months.to_i
end

def calculate_monthly_interest(apr)
  apr / 12 / 100
end

def calculate_monthly_payment(loan_amount, monthly_interest, duration)
  loan_amount * (monthly_interest / (1 - (1 + monthly_interest)**(-duration)))
end

def display_result(loan_amount, monthly_interest, duration, monthly_payment)
  prompt <<-MSG
    For a loan of $#{loan_amount}, to be paid over #{duration} months
    at a monthly interest rate of #{(monthly_interest * 100).round(3)}%, your monthly
    payment wil be $#{monthly_payment.round(2)}.
    MSG
end

def run_again?
  loop do
    prompt(MESSAGES['run_again'])
    input = gets.chomp.upcase
    return true if %w(YES Y).include?(input)
    return false if %w(NO N).include?(input)
  end
end

def display_goodbye
  prompt(MESSAGES['goodbye'])
end
#### MAIN ############
loop do
  clear_screen
  display_welcome
  loan_amount = get_amount
  apr = get_apr
  duration = get_duration_in_months
  monthly_interest = calculate_monthly_interest(apr.to_f)
  monthly_payment = calculate_monthly_payment(loan_amount.to_f, monthly_interest,
                                              duration)
  clear_screen
  display_result(loan_amount, monthly_interest, duration, monthly_payment)
  break unless run_again?
end
display_goodbye
