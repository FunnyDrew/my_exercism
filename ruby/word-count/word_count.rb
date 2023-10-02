=begin
Write your code for the 'Word Count' exercise in this file. Make the tests in
`word_count_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/word-count` directory.
=end
class Phrase
  def initialize (words)
    @phrase = words
  end
  def word_count
    @phrase.downcase
    .gsub(/'/,'_')
    .gsub(/[\W]/,' ')
    .gsub(/_/,'\'')
    .gsub(/\B'/, ' ')
    .gsub(/'\B/, ' ')
    .split(' ').each_with_object({}) do |word, acc|
      acc[word] ||= 0
      acc[word] += 1
    end
  end
end
