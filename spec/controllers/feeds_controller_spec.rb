require 'spec_helper'

describe FeedsController do

  describe 'github_feeds' do
    render_views

    before :each do
      links =["File://#{Rails.root}/spec/resources/member.atom"]
      GitFeedsHandler.fetch_and_create_feeds_enrties(links)
    end

    it 'response ok' do
      get :github_feeds
      expect(response).to be_succes
    end

    it 'has to render partial github_feeds' do
      get :github_feeds
      expect(response.body).to match /Recent Feeds/m
    end

    it 'has to assign @entries' do
      get :github_feeds
      expect(assigns(:entries).size).to eq(GithubFeedEntry::LAST_ADDED)
    end

    it 'has to render partial github_feeds with atom entries' do
      get :github_feeds
      expect(response.body).to match /vairix-dfernandez/m
    end

  end
end