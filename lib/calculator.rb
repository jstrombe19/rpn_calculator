class Calculator
  def self.greeting
    puts "\n\nWelcome to the Reverse Polish Notation (RPN) Calculator!\n\n"
  end

  def self.operate(a, b, operand)
    case operand
    when '+'
      b + a
    when '-'
      b - a
    when '*'
      b * a
    when '/'
      b / a
    end
  end

  def self.calculate
    @stack = []
    loop do
      @input = gets.chomp
      case @input
        when /\d/
          @stack << @input.to_i
        when /\*|\-|\+|\//
          @stack.push(operate(@stack.pop, @stack.pop, @input))
          puts @stack.last
        when 'q'
          main_menu
        else
          puts "Invalid input. Please enter a number or operator."
      end
    end
  end

  def self.main_menu
    puts "-----------------Main Menu--------------"
    puts "1. Open calculator"
    puts "2. How do I use this calculator?"
    puts "----------------------------------------"
    puts "\nType 'q' to exit."

    @response = gets.chomp

    if @response == "1"
      puts "\n\nPlease enter a number or operator symbol (+, -, /, *). Type 'q' to exit."
      calculate

    elsif @response == "2"
      puts "-------------How To Use This Calculator-------------"
      puts "This calculator evaluates math problems expressed in Reverse Polish Notation (RPN)."
      puts "RPN is a method for representing expressions where the operator symbol is placed after the numbers being operated on.\n\n"
      puts "Example: '3+1' is expressed as '3 1 +'\n\n"
      puts "When using this calculator, enter a single number or operator per line."
      puts "-----------------------------------------------------\n\n"
      main_menu
    elsif @response == "q"
      quit

    else
      puts "\n\nInvalid option. Please enter an option from the menu below.\n\n"
      main_menu
    end
  end

  def self.quit
    puts "\n\nBye!"
    exit
  end
end