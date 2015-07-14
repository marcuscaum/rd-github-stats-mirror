require 'test_helper'

describe PullRequests do

  let(:prs) { PullRequests.new('rdstation', state: 'open', since: 1.day.ago) }

  it 'fetches all PRs with state specified' do
    prs.fetch_all.wont_be_empty
  end

  it 'fetches only PRs since date' do
    time_window = 1.day.ago
    list = prs.fetch
    list.each { |pr| pr.updated_at.must_be :>=, time_window }
  end
end
