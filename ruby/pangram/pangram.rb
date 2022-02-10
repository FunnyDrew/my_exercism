=begin
Write your code for the 'Pangram' exercise in this file. Make the tests in
`pangram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/pangram` directory.
=end
class Pangram
    
    def self.pangram?(sentence)
        @sentence = sentence
        arrayed_sentence = normalize_sentence.split("")
        filtered = alphabet.select  do |letter|
            arrayed_sentence.include?(letter)
        end
        filtered == alphabet
    end

    def self.alphabet
        ("a".."z").to_a 
    end

    def self.normalize_sentence
        @sentence.gsub(/\s+/, "").downcase
    end
end

