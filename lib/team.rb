class Team

  attr_reader :country, :players
  attr_accessor :eliminated

  def initialize(country)
    @country = country
    @players = []
    @eliminated = false
  end

  def eliminated?
    @eliminated
  end

  def add_player(player)
    @players << player
  end

  def players_by_position(position)
    @players.select do |player|
      player.position == position
    end
  end

end
