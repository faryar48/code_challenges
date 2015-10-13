require 'pry'
require 'step'

class Player
  attr_accessor :player_name, :player_symbol

  def initialize(player_symbol)
    @player_name = get_name
    @player_symbol = player_symbol
  end

  def get_name
    p "What is your name? "
    response = gets.chomp
  end
end

class ConnectFour
  attr_accessor :grid, :player_one, :player_two, :row_pick, :column_pick

  def initialize
    @grid = [
      ['-', '-', '-', '-', '-', '-', '-'],
      ['-', '-', '-', '-', '-', '-', '-'],
      ['-', '-', '-', '-', '-', '-', '-'],
      ['-', '-', '-', '-', '-', '-', '-'],
      ['-', '-', '-', '-', '-', '-', '-'],
      ['-', '-', '-', '-', '-', '-', '-']
    ]
    @player_one = Player.new("X")
    @player_two = Player.new("O")
    @cell_coord = []
    @cell_coord_one = []
    @cell_coord_two = []
  end

  def show_grid
    @grid.reverse.each do |row|
      print "|"
      row.each { |cell| print "#{cell}|" }
      puts "\n---------------"
    end
    puts " 0 1 2 3 4 5 6"
  end

  def round
    p "Connect Four:: #{@player_one.player_name} v #{@player_two.player_name}"
    show_grid
    players = [@player_one, @player_two]
    while !grid_full? || !winner?
      players.each do |player|
        p "#{player.player_name} choose a column from 0 - 6: "
        column = gets.chomp.to_i
        which_column?(column, player)
        show_grid
        if winner?
          p "#{player.player_name} is the winner!"
          return
        end
        return "TIE!!!" if grid_full?
      end
    end
  end

  def which_column?(column, player)
    if column.between?(0, 6)
      row = which_row?(column)
      if row.is_a? String
        p row
        p "Please pick a different column: "
        column = gets.chomp.to_i
        which_column?(column, player)
      else
        drop_piece(row, column, player.player_symbol)
      end
    else
      p "That column does not exist, please pick a different column: "
      column = gets.chomp.to_i
      which_column?(column, player)
    end
  end


  def drop_piece(row, column, symbol)
    @cell_coord = [row, column]
    @grid[row][column] = symbol
    @cell_coord_one.push(@cell_coord) if symbol == "X"
    @cell_coord_two.push(@cell_coord) if symbol == "O"
  end


  def grid_full?
    @grid.each do |row|
      return false if row.include?("-")
    end
    return true
  end

  def which_row?(column)
    @grid.each_with_index do |row, i|
      if @grid[i][column] == "-"
        return i.to_i
      end
    end
    return "This column is full"
  end

  def insert_symbol(column, player)
    row = which_row?(column)
    @board[row][column] = player.player_symbol
  end

  def self.winning_sequences(coord)
    winning_sequences = []
    row = coord[0]
    column = coord[1]

    row_arrays = ((0..5).to_a.combination(4).to_a).select { |poss_row| (poss_row[-1] - poss_row[0] == 3) && (poss_row.include?(row))}

    column_arrays = ((0..6).to_a.combination(4).to_a).select { |poss_column| (poss_column[-1] - poss_column[0] == 3) && (poss_column.include?(column))}

    row_arrays.each do |each_row|
      winning_sequence = []
      each_row.map {|x| winning_sequence.push([x, column])}
      winning_sequences.push(winning_sequence)
    end

    column_arrays.each do |each_column|
      winning_sequence = []
      each_column.map { |y| winning_sequence.push([row, y])}
      winning_sequences.push(winning_sequence)
    end

    row_indices = []
    row_arrays.each do |row_array|
      row_indices.push(row_array.index(row))
    end

    column_indices = []
    column_arrays.each do |column_array|
      column_indices.push(column_array.index(column))
    end

    row_indices.each_with_index do |row_index, i_row|
      column_indices.each_with_index do |column_index, i_col|
        if row_index == column_index
          winning_sequences.push(row_arrays[i_row].zip(column_arrays[i_col]))
        end
      end
    end

    column_indices_reverse = []
    column_arrays.each do |column_array|
      column_array = column_array.reverse
      column_indices_reverse.push(column_array.index(column))
    end

    row_indices.each_with_index do |row_index, i_row|
      column_indices_reverse.each_with_index do |column_index, i_col|
        if row_index == column_index
          winning_sequences.push(row_arrays[i_row].zip(column_arrays[i_col].reverse))
        end
      end
    end
    winning_sequences
  end

  def winner?
    winning_sequences = self.class.winning_sequences(@cell_coord)

    winning_sequences.each do |win|
      return true if ((@cell_coord_one.sort & win) == win) || ((@cell_coord_two.sort & win) == win)
    end
    return false
  end

end





# @grid[row][column]

# row between 0 - 5
# column between 0 - 6

# |-|-|-|-|O|-|-|   # [5, 4]
# ---------------
# |-|-|-|-|X|-|-|   # [4, 4]
# ---------------
# |-|-|-|-|O|-|-|   # [3, 4]
# ---------------
# |-|-|-|-|X|-|-|   # [2, 4]
# ---------------
# |-|-|-|-|O|-|-|   # [1, 4]
# ---------------
# |-|-|-|-|X|-|-|   # [0, 4]
# ---------------













create_list_test_cases = [
  {given: [0,0], expected: [
    [[0,0], [1,0], [2,0], [3,0]],
    [[0,0], [0,1], [0,2], [0,3]],
    [[0,0], [1,1], [2,2], [3,3]]]},

  {given: [0,1], expected: [
    [[0,1], [1,1], [2,1], [3,1]],
    [[0,0], [0,1], [0,2], [0,3]],
    [[0,1], [0,2], [0,3], [0,4]],
    [[0,1], [1,2], [2,3], [3,4]]]},

  {given: [2,3], expected: [
    [[0,3], [1,3], [2,3], [3,3]],
    [[1,3], [2,3], [3,3], [4,3]],
    [[2,3], [3,3], [4,3], [5,3]],

    [[2,0], [2,1], [2,2], [2,3]],
    [[2,1], [2,2], [2,3], [2,4]],
    [[2,2], [2,3], [2,4], [2,5]],
    [[2,3], [2,4], [2,5], [2,6]],

    [[0,1], [1,2], [2,3], [3,4]],
    [[1,2], [2,3], [3,4], [4,5]],
    [[2,3], [3,4], [4,5], [5,6]],

    [[0,5], [1,4], [2,3], [3,2]],
    [[1,4], [2,3], [3,2], [4,1]],
    [[2,3], [3,2], [4,1], [5,0]]]},

]




if ENV.has_key?('TEST')
  create_list_test_cases.each do |test_case|
    actual = ConnectFour.winning_sequences(test_case[:given])
    if actual == test_case[:expected]
      p "pass"
    else
      p "fail", actual, test_case[:expected]
      # binding.pry
      exit
    end
  end
else
  new_game = ConnectFour.new
  new_game.round
end














