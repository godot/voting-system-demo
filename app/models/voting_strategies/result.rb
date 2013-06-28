require 'voting_strategy_contingent'
module VotingStrategies
  class Result
    attr_reader :ballots
    def initialize(ballots)
      @ballots = ballots
    end

    def result
      VotingStrategyContingent::Strategy.new.result(@ballots, [])
    end
  end
end
