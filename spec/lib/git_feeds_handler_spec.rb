require 'spec_helper'
require 'feeds/git_feeds_handler'

describe GitFeedsHandler do

  describe 'retrieve_org_members_links' do

    before :each do
      RestClient.stub(:get).and_return(File.read('spec/resources/members.json'))
    end

    it 'retrieves the members links of the organization as an array' do
      expect(GitFeedsHandler.retrieve_org_members_links.class.name).to eq('Array')
    end

    it 'verify members is not empty' do
      expect(GitFeedsHandler.retrieve_org_members_links).not_to be_empty
    end

  end

  describe 'fetch_and_create_feeds_enrties' do

    before :each do
      @links =["File://#{Rails.root}/spec/resources/member.atom"]
    end

    it 'has to fetch entries from feeds' do
      expect{ GitFeedsHandler.fetch_and_create_feeds_enrties(@links) }.to change{GithubFeedEntry.count}.by(11)
    end

  end

end

