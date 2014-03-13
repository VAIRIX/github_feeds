class GithubFeedEntry < ActiveRecord::Base

  LAST_ADDED = 10

  def self.last_added
    self.order(published: :desc).limit(LAST_ADDED)
  end

end
