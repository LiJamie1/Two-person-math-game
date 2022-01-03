require './Player'
require './Questions'
require './Turns'

class Game
  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @Turns = Turn.new
    @Questions = Questions.new
    question1 = @Questions.new_question(1)
    first_question(question1)
  end

  def first_question(question)
    @player1.lose_life unless question
    @Turns.next_turn
    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
    new_question = @Questions.new_question(@Turns.turn)
    handle_questions(new_question)
  end

  def handle_questions(question)
    unless question
      @Turns.turn == 1 ? @player1.lose_life : @player2.lose_life
      @Turns.next_turn
    end

    if @player1.lives > 0 && @player2.lives > 0
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
      new_question = @Questions.new_question(@Turns.turn)
      handle_questions(new_question)
    else
      if @player1.lives == 0
        puts "Player 2 wins with a score of #{@player2.lives}"
      elsif @player2.lives == 0
        puts "Player 1 wins with a score of #{@player1.lives}"
      end
      puts '----- GAME OVER -----'
      nil
    end
  end
end

Game.new