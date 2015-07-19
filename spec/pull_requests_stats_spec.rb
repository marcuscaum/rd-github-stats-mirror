require 'spec_helper'

describe PullRequestsStats do

  let(:prs) { load_response('pull_requests') }
  let(:stats) { PullRequestsStats.new prs }

  it 'counts by state' do
    expect(stats.count_by_state).to be_eql({ "open" => 2, "closed" => 1 })
  end

  it 'counts by user' do
    users_count = { "lucasandre" => 1, "jonatas" => 1, "andrehjr" => 1 }
    expect(stats.count_by_user).to be_eql(users_count)
  end

  it 'counts by a specific user' do
    expect(stats.count_by_user('lucasandre')).to be_eql(1)
  end

  it 'counts all comments in PRs' do
    allow_any_instance_of(PullRequest).to receive(:count_all_comments).and_return(42)
    comments = { 4200 => 42, 1500 => 42, 1600 => 42 }
    expect(stats.count_all_comments).to be_eql(comments)
  end

  it 'measures the size of PRs' do
    allow_any_instance_of(PullRequest).to receive(:count_commits).and_return(42)
    sizes = { 4200 => 42, 1500 => 42, 1600 => 42 }
    expect(stats.size).to be_eql(sizes)
  end

  it 'measures the duration of PRs' do
    durations = { 1600 => 1.days.to_f }
    expect(stats.duration).to be_eql(durations)
  end

  it 'counts all the collaborations made by a specific user in the PRs' do
    comments = load_response('comments')
    allow_any_instance_of(PullRequest).to receive(:unified_comments).and_return(comments)
    expect(stats.collaborations('andrehjr')).to be_eql(6)
  end
end