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
    return { phrase: "#{word} is not a valid English word", points: 0 } unless check(hash)
    return { phrase: "#{letters} does not contain #{word}", points: 0 } unless is_valid?(word, letters)
    { points: word.length ** 2, phrse: "Congratulations! #{word} is valid!" }
  end
end
