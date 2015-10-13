# In the game of Ghost, two players take turns building up an English word from left to right. Each player adds one letter per turn. The goal is to not complete the spelling of a word: if you add a letter that completes a word (of 4+ letters), or if you add a letter that produces a string that cannot be extended into a word, you lose. (Bluffing plays and "challenges" may be ignored for the purpose of this puzzle.)

# Write a program that allows a user to play Ghost against the computer.

# The computer should play optimally given the following dictionary: WORD.LST (1.66 MB). Allow the human to play first. If the computer thinks it will win, it should play randomly among all its winning moves; if the computer thinks it will lose, it should play so as to extend the game as long as possible (choosing randomly among choices that force the maximal game length).

# In your submission email, answer this question: if the human starts the game with 'n', and the computer plays according to the strategy above, what unique word will complete the human's victory?

File.open("wordlist.txt", "r") do |f|
  f.each_line do |line|
    puts line
  end
end

class Player
  attr_accessor :player_name

  def initialize
    @player_name = get_name
  end

  def get_name
    p "What is your name? "
    response = gets.chomp
  end
end

class Ghost
  attr_accessor :letter_pick, :human_player, :computer_player

  def initialize
    @human_player = Player.new
    @letter_pick = []
  end

  def show_letters
    @letter_pick.each do |letter|
      print letter
    end
  end

  def round
    p "Ghost:: #{@human_player.player_name} v Computer"
    show_letters
    while !winner?
      p "#{@human_player.player_name} choose a letter: "
      letter = gets.chomp
      show_letters
      computer_letter(letter)
      show_letters
      if winner?
        p "#{player.player_name} is the winner!"
        return
      end
      return "TIE!!!" if grid_full?
    end
  end

  def computer_letter(letter)
  end

  def winner?
    false
  end


end




























