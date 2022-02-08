=begin
Write your code for the 'Anagram' exercise in this file. Make the tests in
`anagram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/anagram` directory.
=end
class Anagram
    def initialize(word)
        @word = word
    end

    def word
        @word.downcase
    end

    def to_h(word)
        word.split("").reduce({}) do |acc, ch|
            acc.include?(ch) ? acc[ch] +=1 : acc[ch] = 1
            acc
        end
    end

    def match(words)
        main = self.to_h(word)
        words.select do |w|
            w.downcase == word ? false : self.to_h(w.downcase) == main
        end
    end
end

