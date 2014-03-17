class AddIndexToGithubFeedEntry < ActiveRecord::Migration
  def change
    add_index :github_feed_entries, :entry_id
  end
end
