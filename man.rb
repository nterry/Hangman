class Man
  
  def initialize
    @phase = 0
    @base = <<STAND
    ______
    |    |
    |
    |
    |
____|____
STAND
    @phases = []
    @phases << ""
    @phases << <<HANGMAN


    0 - Uh Oh!!!




HANGMAN
    @phases << <<HANGMAN


    0 - Oh dear, I seem to be
   /|   materializing in a noose


HANGMAN
    @phases << <<HANGMAN


    0 - Good sir! Be a bolly old
   /|\\  chap and do lend a hand?

HANGMAN
    @phases << <<HANGMAN


    0 - It's... getting rather hard to breathe...
   /|\\  Tea... and crum...pets?
   /
HANGMAN
    @phases << <<HANGMAN


    0 - Bollocks....
   /|\\
   / \\
HANGMAN
  end
  
  
  def increment
    @phase += 1 unless @phase >= 5
  end
  
  def render
    @base.split("\n").collect!.with_index do |base, index|
      merge(base, @phases[@phase].split("\n")[index])
    end
  end
  
  
  private
  
  def merge(line1, line2)
    "#{line1.chomp}#{line2}"
  end
end