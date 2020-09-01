require 'minitest/autorun'
require 'minitest/pride'
require './lib/team'
require './lib/player'


class PlayerTest < Minitest::Test
  def setup
    @team = Team.new("France")
  end

  def test_it_exists
    assert_instance_of Team, @team
  end

  def test_it_has_attributes
    assert_equal "France", @team.country
  end

  def test_the_team_has_been_eliminated
    assert_equal false, @team.eliminated?
    
    @team.eliminated = true

    assert @team.eliminated?
  end

  def test_the_team_has_players
    assert_equal [], @team.players

    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})

    @team.add_player(mbappe)
    @team.add_player(pogba)

    assert_equal [mbappe, pogba], @team.players
  end

  def test_returning_players_by_position

    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})

    @team.add_player(mbappe)
    @team.add_player(pogba)

    assert_equal [pogba], @team.players_by_position("midfielder")
    assert_equal [], @team.players_by_position("defender")
  end
end
