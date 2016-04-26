class WheelOfFortune
  attr_reader :theme, :guesses

  def initialize(input)
    @phrase = input[:phrase]
    @theme = input[:theme]
    @guesses = []
  end

  def to_s

    guessed = @guesses.join.to_s.strip.downcase

    alphabet = "abcdefghijklmnopqrstuvwxyz"
    filtered_alpha = alphabet.gsub(/#{guessed}/, '')
    wtf = @phrase.gsub(/#{filtered_alpha}/, '_')

    p "-------"
    p guessed
    p "filtered = " + filtered_alpha
    p wtf
    
    @phrase.gsub(/#{filtered_alpha}/, '_')

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
