require 'rest_client'

module GitFeedsHandler

  def self.retrieve_org_members_links
    result = RestClient.get('https://api.github.com/orgs/vairix/members')
    parsed_result = YAML.load(result.gsub(/\=>/, ': '))
    parsed_result.map{ |member| "#{member['html_url']}.atom" }
  end

  def self.fetch_and_create_feeds_enrties(links)
    feeds = Feedzirra::Feed.fetch_and_parse(links)
    links.each do |link|
      GitFeedsHandler.add_entries(feeds[link].entries)
    end
  end

  def self.update_github_feeds
    links = GitFeedsHandler.retrieve_org_members_links
    GitFeedsHandler.fetch_and_create_feeds_enrties links
  end

  private

  def self.add_entries(entries)
    entries.each do |entry|
      unless GithubFeedEntry.find_by(entry_id: entry.entry_id)
        GithubFeedEntry.create!(
          entry_id:  entry.entry_id,
          published: entry.published,
          updated:   entry.updated,
          url:       entry.url,
          title:     entry.title,
          author:    entry.author,
          content:   entry.content
        )
      end
    end
  end

end