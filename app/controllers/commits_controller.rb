class CommitsController < ApplicationController
  def create
    commits = params["commits"]
    commits.each do |commit|
      user = User.first_or_create(login: commit["author"]["name"])
      commit = user.commits.create(sha: commit["id"],
                                   message: commit["message"],
                                   url: commit["url"])
    end
  end

  def index
    @commits = Commit.all.order(created_at: :desc).limit(100).includes(:user)
    @latest_user = User.last
    @latest_time = Commit.last.created_at
  end
end
