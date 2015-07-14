require 'test_helper'

describe PullRequests do

  let(:prs) { PullRequests.new('rdstation', state: 'open') }

  it 'fetches all PRs with state specified' do
    prs.fetch.wont_be_empty
  end

  it 'fetches only PRs since date' do
    list = prs.fetch_since(1.day.ago)
    list.each { |pr| pr.updated_at.must_be :>=, 1.day.ago }
  end
end
