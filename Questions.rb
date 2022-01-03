class Questions
  def initialize
    @number1 = nil
    @number2 = nil
  end

  def new_question(turn)
    puts '----- NEW TURN -----'
    @number1 = rand(20)
    @number2 = rand(20)
    case turn
    when 1
      puts "Player One: What is #{@number1} + #{@number2}?"
    when 2
      puts "Player Two: What is #{@number1} + #{@number2}?"
    end
    correct?(gets.chomp.to_i)
  end

  def correct?(answer)
    if answer == @number1 + @number2
      puts 'Yes! you are correct.'
      true
    else
      puts 'Seriously? No!'
      false
    end
  end
  
end