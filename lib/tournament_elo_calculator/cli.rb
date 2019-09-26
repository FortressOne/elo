require 'thor'

module TournamentEloCalculator
  class CLI < Thor

    desc "results"
    def results
      puts TournamentEloCalculator.results
    end
  end
end
