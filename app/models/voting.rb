class Voting
  def self.register(session_id, voting)
    Storage.save(id: session_id, voting: voting, updated_at: Time.now)
  end

  def self.current
    Voting.new()
  end

  def self.all
    Storage.find()
  end

  def candidates
    %w(ja ty on ona oni wy tamci temte)
  end

  def ballot
    Ballot.new(candidates: candidates)
  end

  def result
    ballots = Voting.all.map {|voting|
      votes = voting['voting']

      Ballot.new(votes: votes.map {|vote,index| Vote.new(vote, votes.index(vote)+1)  })
    }

    VotingStrategies::Result.new(ballots)
  end

  Vote = Struct.new(:candidate, :position)
end
