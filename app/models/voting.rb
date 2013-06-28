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
end
