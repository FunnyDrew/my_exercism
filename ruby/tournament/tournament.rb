=begin
Write your code for the 'Tournament' exercise in this file. Make the tests in
`tournament_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/tournament` directory.
=end
class Tournament
  def self.tally(input) 
    return head if input == "\n"
    
    teams_board=[]

    plays= parse(input)
    plays.each do |play|
      teams = parse_play(play)
      teams.map do |team|
        index = teams_board.index do |item| 
          item[:name] == team[:name]
        end
        if index
          teams_board[index][:MP] += team[:MP]
          teams_board[index][:W] += team[:W]
          teams_board[index][:D] += team[:D]
          teams_board[index][:L] += team[:L]
          teams_board[index][:P] += team[:P]
        else
          teams_board<<team;
        end
      end
    end
    
    sorted_board = teams_board.sort_by{|team| [-team[:P], team[:name]]}
    print(sorted_board)
  end

  def self.parse(input)
    input.split("\n")
  end

  def self.parse_play(str)
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

  def self.print(team_board)
    head = "Team".ljust(31)<<"| MP |  W |  D |  L |  P\n"
    head<<team_board.map do |team|
      "#{team[:name]}".ljust(31)<<"|  #{team[:MP]} |  #{team[:W]} |  #{team[:D]} |  #{team[:L]} |  #{team[:P]}"
    end.join("\n")<<"\n"
    
  end
  
  def self.head
    head = "Team".ljust(31)<<"| MP |  W |  D |  L |  P\n"
  end

end
