class BadGuessError < StandardError
end

class WinningGuessException < StandardError
end

class Word

  def initialize
    @word = "vermont"
    @guessed = @word.split("").collect {"_"}
  end

  def guess(letter)
    raise BadGuessError unless @word.include? letter
    @guessed = merge render_word(letter), @guessed
    raise WinningGuessException if won?
  end

  def render
    @guessed.map { |s| "#{s}" }.join(' ')
  end


  private

  def won?
    won = true
    @guessed.each_with_index do |val, index|
      won = false unless (val == @word[index])
    end
    won
  end

  def merge(word1, word2)
    merged = []
    word1.each_with_index do |val, index|
      merged << val unless val == "_"
      merged << word2[index] unless word2[index] == "_"
      merged << "_" if (val == "_" && word2[index] == "_")
    end
    merged
  end

  def render_word(letter)
    final_str = []
    @word.split("").each_with_index do |char, index|
      if (char == letter && @guessed[index] == "_")
        final_str << char
      else
        final_str << "_"
      end
    end
    final_str
  end
end