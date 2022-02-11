=begin
Write your code for the 'Rna Transcription' exercise in this file. Make the tests in
`rna_transcription_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/rna-transcription` directory.
=end

module Complement
  
  def self.of_dna(arg)
  rna_map = {
    "G" => "C",
    "C" => "G",
    "T" => "A",
    "A" => "U"
  }
    return "" if arg == ""
    arg.split('').map{|item| rna_map[item]}.join
  end
end
