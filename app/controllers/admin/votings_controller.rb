class Admin::VotingsController < ApplicationController
  def index
    respond_with(collection)
  end

  private
  def collection
    @votings = Voting.all
  end
end
