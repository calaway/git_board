class CommitsController < ApplicationController
  def create
    commits = params["commits"]
    commits.each do |commit|
      user = User.find_or_create_by(login: commit["author"]["name"])
      commit = user.commits.create(sha: commit["id"],
                                   message: commit["message"],
                                   url: commit["url"])
    end
  end

  def index
    @commits = Commit.all.order(created_at: :desc).limit(10).includes(:user)
    @latest_user = @commits.first.user.login
    @latest_time = Commit.last.created_at
  end
end
