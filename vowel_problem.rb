class VowelProblem

  def initialize(words: "")
    @words = words
  end

  def play()
    puts check_vowel
  end

private
  def check_vowel()
    @words.map! do |word|
      word.match(/[aiueoAIUEO]/) ? word.upcase : word.downcase
    end
  end
end

if __FILE__ == $0
  args = $stdin.read.split("\n")
  VowelProblem.new(words: args).play
end
