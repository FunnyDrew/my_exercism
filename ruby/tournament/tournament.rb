=begin
Write your code for the 'Tournament' exercise in this file. Make the tests in
`tournament_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/tournament` directory.
=end
class Tournament
  def self.tally(input)    
    head = "Team".ljust(31)<<"| MP |  W |  D |  L |  P\n" 
    team_board=[]
    teams= parse(input)
    teams.map do |team|
      index = team_board.index?()
    end
  end

  def self.parse(str)
    team1_name, team2_name, result = str.split(";")

    if result.strip == "draw"
      team1 = {name: team1_name.strip, MP: 1, W: 0, D: 1, L: 0, P: 1}
      team2= {name: team2_name.strip, MP: 1, W: 0, D: 1, L: 0, P: 1}
    elsif result.strip == "win"
      team1 = {name: team1_name.strip, MP: 1, W: 1, D: 0, L: 0, P: 3}
      team2 = {name: team2_name.strip, MP: 1, W: 0, D: 0, L: 1, P: 0}
    else
      team1 = {name: team1_name.strip, MP: 1, W: 0, D: 0, L: 1, P: 0}
      team2= {name: team2_name.strip, MP: 1, W: 1, D: 0, L: 0, P: 3}
    end
    [team1, team2]
  end

end

puts Tournament.tally("tin; bin; lost")
