class WheelOfFortune
  attr_reader :theme, :guesses

  def initialize(input)
    @phrase = input[:phrase]
    @theme = input[:theme]
    @guesses = []
  end

  def to_s
    return @phrase if @guesses == []

    @guessed = @guesses.join.to_s.strip
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    filtered_alpha = alphabet.gsub(/[#{@guessed}]/i, '')
    @subbed = @phrase.gsub(/[#{filtered_alpha}]/i, '_')
    @subbed
  end

  def can_i_have?(input)
    input = input.downcase
    phrase_downcase = @phrase.downcase
    @guesses << input
    phrase_downcase.include? input
  end

  def game_over?
    subber = @guesses.join.to_s.strip
    if @phrase.gsub(/[#{subber}]/i, '').strip == ""
      p true
      return true
    else
      p false
      return false
    end
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
