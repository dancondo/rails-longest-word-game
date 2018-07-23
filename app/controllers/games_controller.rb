require 'json'
require 'open-uri'

class GamesController < ApplicationController

  def points

  end

  def new
    all_letters = [*"A".."Z"]
    vowels = ["A", 'E', "I", "O", "U"]
    vowels.each { |v| all_letters << v }
    @letters = []
    10.times { @letters << all_letters.sample }
  end

  def score
    filepath = 'https://wagon-dictionary.herokuapp.com/'
    @word = params[:word]
    @letters = params[:token].split
    json = open(filepath + @word).read
    @result = JSON.parse(json)
  end
end
