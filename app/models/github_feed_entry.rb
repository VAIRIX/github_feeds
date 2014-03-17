class GithubFeedEntry < ActiveRecord::Base

  LAST_ADDED = 10

  scope :last_added, -> { order(published: :desc).limit(LAST_ADDED) }

end
