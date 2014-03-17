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
      (1..GithubFeedEntry::LAST_ADDED + 2).each do
        GithubFeedEntry.make!
      end
    end

    it 'return the MAX permitted size even there are more' do
      feeds_entries
      expect(GithubFeedEntry.last_added.length).to eq(GithubFeedEntry::LAST_ADDED)
    end

    it 'returns results in the correct order' do
      feeds_entries
      entry = GithubFeedEntry.make!(published: Time.now + 2.days)
      expect(GithubFeedEntry.last_added.first.id).to eq(entry.id)
    end
  end
end
