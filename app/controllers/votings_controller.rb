class VotingsController < ApplicationController
  def show
    @recent = session[:voting]
    respond_with(resource)
  end

  def create
    session[:voted_at] = Time.now
    session[:voting]   = params[:candidates]

    Voting.register( session.id, params[:candidates] )

    redirect_to voting_url
  end

  def destroy
    session.clear
  end

  protected
  def resource
    @ballot ||= current_voting.ballot
  end

  def current_voting
    Voting.current
  end
end
