class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    return (input.to_i - 1)
  end
  
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    else
      return false
    end
  end
  
  def valid_move?(index)
    if !index.is_a?(Integer) || index > 8 || position_taken?(index)
      return false
    else
      return true
    end
  end
  
  def turn_count
    return @board.count do |position| 
      position == "X" || position == "O"
    end
  end
  
  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end
    
  def move(index, token = "X")
    @board[index] = token
  end
  
  def turn
    puts "Enter a position:"
    input = gets.chomp
    index = input_to_index(input)
    valid = valid_move?(index)
    while (valid == false) do
      input = gets.chomp
      index = input_to_index(input)
      valid = valid_move?(index)
    end
    move(index, current_player)
    display_board
  end
  
  def won
    result = false
    WIN_COMBINATIONS.each do |combo|
      if combo.all?{|position| position == "X"}
        result == combo
      elsif combo.all?{|position| position == "O"}
        result == combo
      end
    end
    
    return result
  end
  
  def full
    return @board.all?{|position| position != " "}
  end
  
  def draw
    if full == true && won == false
      return true
    else
      return false
    end
  end
  
  def over
    if won || draw
      return true
    else
      return false
    end
  end
  
  def winner
    return @board[won[0]]
  end
  
  def play
    until (over == true) do
      turn
    end
    
    if won
      puts "Congratulations #{winner}"
    else
      puts "Game is a draw!"
    end
  end
end