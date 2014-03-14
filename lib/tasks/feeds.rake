namespace :feeds do

  desc "Update feeds from GitHub API"
  task update: :environment do
    require 'feeds/git_feeds_handler'
    GitFeedsHandler.update_github_feeds
  end

end
