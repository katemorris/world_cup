require 'minitest/autorun'
require 'minitest/pride'
require './lib/world_cup'
require './lib/team'
require './lib/player'

class WorldCupTest < Minitest::Test

  def setup
    @france = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    @france.add_player(@mbappe)
    @france.add_player(@pogba)

    @croatia = Team.new("Croatia")
    @modric = Player.new({name: "Luka Modric", position: "midfielder"})
    @vida = Player.new({name: "Domagoj Vida", position: "defender"})
    @croatia.add_player(@modric)
    @croatia.add_player(@vida)

    @world_cup = WorldCup.new(2018, [@france, @croatia])
  end

  def test_it_exists
    assert_instance_of WorldCup, @world_cup
  end

  def test_it_has_attributes
    assert_equal 2018, @world_cup.year
    assert_equal [@france, @croatia], @world_cup.teams
  end

  def test_can_return_active_players_by_position
    assert_equal [@pogba, @modric], @world_cup.active_players_by_position("midfielder")
    @croatia.eliminated = true
    assert_equal [@pogba], @world_cup.active_players_by_position("midfielder")
  end

  def test_can_see_allplayers_by_position
    players_example = {"forward" => [@mbappe], "midfielder" => [@pogba, @modric], "defender" => [@vida]}
    assert_equal players_example, @world_cup.all_players_by_position
  end

end
