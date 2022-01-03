class Turn
  attr_reader :turn

  def initialize
    @turn = 1
  end

  def next_turn
    if @turn == 1
      @turn = 2
    elsif turn == 2
      @turn = 1
    end
  end
end
