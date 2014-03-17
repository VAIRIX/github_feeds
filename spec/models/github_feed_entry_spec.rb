require 'spec_helper'

describe GithubFeedEntry do

  describe 'attributes' do
    it { should respond_to :entry_id  }
    it { should respond_to :published }
    it { should respond_to :updated   }
    it { should respond_to :url       }
    it { should respond_to :title     }
    it { should respond_to :author    }
    it { should respond_to :content   }
  end

  describe 'methods' do
   let(:feeds_entries) do
      (1..GithubFeedEntry::LAST_ADDED).each do
        GithubFeedEntry.make!
      end
    end

    it 'returns the MAX permitted size' do
      feeds_entries
      expect(GithubFeedEntry.last_added.length).to eq(GithubFeedEntry::LAST_ADDED)
    end

    it 'return the MAX permitted size even there are more' do
      feeds_entries
      GithubFeedEntry.make!
      expect(GithubFeedEntry.last_added.length).to eq(GithubFeedEntry::LAST_ADDED)
    end

    it 'returns zero entries' do
      expect(GithubFeedEntry.last_added.length).to eq(0)
    end
  end
end
