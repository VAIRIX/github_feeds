class CreateGithubFeedEntries < ActiveRecord::Migration
  def change
    create_table :github_feed_entries do |t|
      t.string :entry_id
      t.datetime :published
      t.datetime :updated
      t.string :url
      t.string :title
      t.string :author
      t.text :content

      t.timestamps
    end
  end
end
