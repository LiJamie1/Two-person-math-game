require './Player'
require './Questions'
require './Turns'

class Game
  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @turns = Turn.new
    @questions = Questions.new
    question1 = @questions.new_question(1)
    first_question(question1)
  end

  def first_question(question)
    @player1.lose_life unless question
    @turns.next_turn
    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
    new_question = @questions.new_question(@turns.turn)
    handle_questions(new_question)
  end

  def handle_questions(question)
    unless question
      @turns.turn == 1 ? @player1.lose_life : @player2.lose_life
      @turns.next_turn
    end

    if @player1.lives.positive? && @player2.lives.positive?
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
      new_question = @questions.new_question(@turns.turn)
      handle_questions(new_question)
    else
      if @player1.lives.zero?
        puts "Player 2 wins with a score of #{@player2.lives}"
      elsif @player2.lives.zero?
        puts "Player 1 wins with a score of #{@player1.lives}"
      end
      puts '----- GAME OVER -----'
    end
  end
end

Game.new
