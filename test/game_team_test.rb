require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/stat_tracker'
require './lib/game_team'

class GameTeamTest < Minitest::Test

  def setup
    # file_path = "./data/games.csv"
    file_path = "./test/fixtures/short_game_teams.csv"
    @game_teams = GameTeam.from_csv(file_path)

    @base_game_team = GameTeam.new({
      :game_id => 2012030221,
      :team_id => 3,
      :hoa => "away",
      :result => "LOSS",
      :settled_in => "OT",
      :head_coach => "John Tortorella",
      :goals => 2,
      :shots => 8,
      :tackles => 44,
      :pim => 8,
      :powerplayopportunities => 3,
      :powerplaygoals => 0,
      :faceoffwinpercentage => 44.8,
      :giveaways => 17,
      :takeaways => 7
      })
  end

  def test_it_exists
    assert_instance_of GameTeam, @base_game_team
    assert_instance_of GameTeam, @game_teams.first
  end

  def test_it_returns_list_of_game_teams
    assert_instance_of Array, GameTeam.all
    assert_equal 3, GameTeam.all.length
    assert_instance_of GameTeam, GameTeam.all.first
  end

  def test_it_returns_attributes_of_base
    assert_equal 2012030221, @base_game_team.game_id
    assert_equal 3, @base_game_team.team_id
    assert_equal "away", @base_game_team.hoa
    assert_equal "LOSS", @base_game_team.result
    assert_equal "OT", @base_game_team.settled_in
    assert_equal "John Tortorella", @base_game_team.head_coach
    assert_equal 2, @base_game_team.goals
    assert_equal 8, @base_game_team.shots
    assert_equal 44, @base_game_team.tackles
    assert_equal 8, @base_game_team.pim
    assert_equal 3, @base_game_team.power_play_opportunities
    assert_equal 0, @base_game_team.power_play_goals
    assert_equal 44.8, @base_game_team.face_off_win_percentage
    assert_equal 17, @base_game_team.giveaways
    assert_equal 7, @base_game_team.takeaways
  end

  def test_it_returns_attributes_from_collection
    assert_equal 2012030221, @game_teams[0].game_id
    assert_equal 3, @game_teams[0].team_id
    assert_equal "away", @game_teams[0].hoa
    assert_equal "LOSS", @game_teams[0].result
    assert_equal "OT", @game_teams[0].settled_in
    assert_equal "John Tortorella", @game_teams[0].head_coach
    assert_equal 2, @game_teams[0].goals
    assert_equal 8, @game_teams[0].shots
    assert_equal 44, @game_teams[0].tackles
    assert_equal 8, @game_teams[0].pim
    assert_equal 3, @game_teams[0].power_play_opportunities
    assert_equal 0, @game_teams[0].power_play_goals
    assert_equal 44.8, @game_teams[0].face_off_win_percentage
    assert_equal 17, @game_teams[0].giveaways
    assert_equal 7, @game_teams[0].takeaways
  end
end