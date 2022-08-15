require 'open-uri'
require 'json'
class GamesController < ApplicationController

  def new
    @letters = generate_grid(9)
  end

  def score
    @score = params[:word]

  end

  # def score_and_message(attempt, grid)
  #   if word_checker(attempt.upcase, grid)
  #     if english_word?(attempt)
  #       @score = 'well done'
  #     else
  #       @score = 'not an english word'
  #     end
  #   else
  #     @score = "not in the grid"
  #   end
  # end

  def generate_grid(grid_size)
    letters = ("A".."Z").to_a
    Array.new(grid_size) { letters.sample }
  end

  # def english_word?(word)
  #   url = "https://wagon-dictionary.herokuapp.com/#{word}"
  #   correct_word = URI.open(url).read
  #   word_hash = JSON.parse(correct_word)["found"]
  # end

  def word_checker
    letters = @letters.split("")
    letters.all? do |letter|
      grid.count(letter) >= letters.count(letter)
    end
  end
end
