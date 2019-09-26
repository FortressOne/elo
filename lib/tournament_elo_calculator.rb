require 'tournament_elo_calculator/version'
require 'elo'

module TournamentEloCalculator
  class Error < StandardError; end

  def self.results
    Elo.configure do |config|
      config.default_rating = 1000
      config.pro_rating_boundry = 2400
      config.starter_boundry = 30
    end

    teams = {}

    %w[sobar charming ragtag chiken penguin clan-a dacc fab].each do |team|
      teams[team] = Elo::Player.new
    end

    # Oceania
    teams["charming"].wins_from(teams["chiken"])
    teams["sobar"].wins_from(teams["penguin"])
    teams["ragtag"].wins_from(teams["chiken"])
    teams["charming"].wins_from(teams["sobar"])
    teams["ragtag"].wins_from(teams["penguin"])
    teams["sobar"].wins_from(teams["chiken"])
    teams["ragtag"].wins_from(teams["charming"])
    teams["charming"].wins_from(teams["ragtag"])
    teams["chiken"].wins_from(teams["penguin"])
    teams["penguin"].wins_from(teams["chiken"])
    teams["charming"].wins_from(teams["ragtag"])
    teams["charming"].wins_from(teams["penguin"])
    teams["sobar"].wins_from(teams["ragtag"])
    teams["sobar"].wins_from(teams["chiken"])
    teams["ragtag"].wins_from(teams["penguin"])
    teams["charming"].wins_from(teams["sobar"])
    teams["ragtag"].wins_from(teams["chiken"])
    teams["sobar"].wins_from(teams["penguin"])
    teams["charming"].wins_from(teams["chiken"])
    teams["charming"].wins_from(teams["chiken"])
    teams["ragtag"].wins_from(teams["sobar"])
    teams["charming"].wins_from(teams["ragtag"])
    teams["sobar"].wins_from(teams["chiken"])
    teams["ragtag"].wins_from(teams["sobar"])
    teams["charming"].wins_from(teams["ragtag"])

    # Oceania II
    teams["sobar"].wins_from(teams["clan-a"])
    teams["dacc"].wins_from(teams["fab"])
    teams["dacc"].wins_from(teams["sobar"])
    teams["fab"].wins_from(teams["clan-a"])
    teams["sobar"].wins_from(teams["fab"])
    teams["dacc"].wins_from(teams["sobar"])

    # Oceania III
    teams["sobar"].wins_from(teams["fab"])
    teams["dacc"].wins_from(teams["clan-a"])
    teams["dacc"].wins_from(teams["sobar"])
    teams["fab"].wins_from(teams["clan-a"])
    teams["fab"].wins_from(teams["sobar"])

    # Exhibition
    teams["sobar"].wins_from(teams["fab"])
    teams["dacc"].wins_from(teams["sobar"])
    teams["fab"].wins_from(teams["sobar"])

    # Oceania III Grand Final
    teams["fab"].wins_from(teams["dacc"])

    team_ary = teams.map do |name, results|
      [name, results.rating]
    end

    team_ary.sort_by(&:last).reverse
  end
end
