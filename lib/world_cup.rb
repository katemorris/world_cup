class WorldCup

  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    @teams.map do |team|
      if team.eliminated? == false
        team.players_by_position(position)
      end
    end.flatten.compact
  end

  def all_players_by_position
    all_team_players = @teams.map do |team|
      team.players
    end.flatten

    all_team_players.group_by do |player|
      player.position
    end
  end

end
