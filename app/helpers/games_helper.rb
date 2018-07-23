module GamesHelper
  def check(json_hash)
    json_hash["found"]
  end

  def is_valid?(word, letters)
    formed_word = []
    word_split = word.upcase.split("").sort
    @letters.sort.each do |letter|
      formed_word << word_split.shift if word_split.include?(letter)
    end
    formed_word == word.upcase.split("").sort
  end

  def validate_word(hash, word, letters)
    return "Word not found" unless check(hash)
    return "Word invalid" unless is_valid?(word, letters)
    @valid_word = true;
    "Congratulations! #{word} is valid!"
  end
end
