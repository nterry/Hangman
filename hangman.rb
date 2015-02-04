#!/usr/bin/env ruby

require_relative "word"
require_relative "man"

#ENV["TERM"] = "xterm-256color"

@won = false
@lost = false

@word = Word.new
@man = Man.new

@bad_guesses = 0
@bad_limit = 5

def draw
  system "clear"
  sleep(0.1)
  puts @man.render
  puts @word.render
end

def guess
  puts "Guess a letter (or a series of letters)"
  letter = gets.chomp
  letter.split("").each do |char|
    @word.guess(char)
  end
end

def win
  draw
  puts "You won!"
  exit 0
end


def lose
  draw
  puts "You lost!"
  exit 1
end


while (true)
  begin
    draw
    guess
      
  rescue BadGuessError
    @man.increment
    @bad_guesses += 1
    lose unless @bad_guesses < @bad_limit
      
  rescue WinningGuessException
    win
  end
end