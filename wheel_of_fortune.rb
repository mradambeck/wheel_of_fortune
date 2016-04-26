class WheelOfFortune
  attr_reader :theme, :guesses

  def initialize(input)
    @phrase = input[:phrase]
    @theme = input[:theme]
    @guesses = []
  end

  def to_s

    # USE REGEX AND REPLACE INSTEAD OF SPLITTING INTO AN ARRAY, DUH.
    # hidden_phrase = @phrase.downcase.split('')
    # !!!! need to replace anything not guessed with an '_'  !!!!
    guesses_string = @guesses.join
    p "--------"
    p guesses_string
    regex_phrase = "/[" + guesses_string + "]/"
    p regex_phrase
    hidden_phrase = @phrase.gsub(regex_phrase.chomp, '_')
    p "///////////"
    p hidden_phrase
    hidden_phrase
  end

  def can_i_have?(input)
    input = input.downcase
    @phrase = @phrase.downcase
    @guesses << input
    @phrase.include? input
  end

  def game_over?
    nil
  end
end


# Checks to see if we executed this file from the command-line
# e.g. `ruby simple_jepordy.rb`
if __FILE__ == $0

  # DRIVER CODE
  j = WheelOfFortune.new( {theme: "card games", phrase: "Go fish"} )
  j.can_i_have?("g")
  j.can_i_have?("o")
  p j
  puts j # calls j.to_s

end
