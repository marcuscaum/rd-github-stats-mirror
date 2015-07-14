require 'github_api'
require 'active_support/all'
require 'pry'

require 'rd_ghstats/pull_requests'

def commits(repo: 'rdstation')
  gh = Github::Client::Repos.new repo: repo
  gh.commits.list.each do |c|
    puts "#{c.commit.committer.name} - #{c.commit.message}"
  end
end

#prs = PullRequests.new('rdstation', state: 'open')
#fetched = prs.fetch
#comments = prs.comments(fetched.first)
