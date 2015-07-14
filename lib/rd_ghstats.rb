require 'github_api'
require 'pry'
require 'active_support/all'

require_relative 'rd_ghstats/pull_requests'

Github.configure do |c|
  c.basic_auth = 'lucasandre:575f946dfb6be40d3672c8d4776814436e6dc4b4'
  c.user = 'ResultadosDigitais'
  c.org = 'ResultadosDigitais'
end

def commits(repo: 'rdstation')
  gh = Github::Client::Repos.new repo: repo
  gh.commits.list.each do |c|
    puts "#{c.commit.committer.name} - #{c.commit.message}"
  end
end

prs = PullRequests.new('rdstation', state: 'all')
count = prs.count { |pr| pr.state }

binding.pry

#gh.repos.list.each do |repo|
  #binding.pry
#end
