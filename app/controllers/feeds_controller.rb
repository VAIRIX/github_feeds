require 'feeds/git_feeds_handler'

class FeedsController < ApplicationController
  def index
    @entries = GithubFeedEntry.last_added
  end

  def github_feeds
    @entries = GithubFeedEntry.last_added
    render partial: 'github_feeds'
  end
end
