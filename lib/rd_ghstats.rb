require 'octokit'
require 'active_support/all'
require 'pry'

require_relative 'rd_ghstats/repo'
require_relative 'rd_ghstats/report_helper'

Octokit.configure do |c|
  c.login = 'lucasandre'
  c.password = '575f946dfb6be40d3672c8d4776814436e6dc4b4'
  c.auto_paginate = true
end

def full_report
  puts
  puts '=' * 80
  repo_name = 'ResultadosDigitais/rdstation'
  repo = Repo.new repo_name

  open_prs = repo.pull_requests

  puts "Number of open PRs in #{repo_name} = #{ReportHelper.count(open_prs)}"
  puts

  puts "PRs opened by user"
  puts ReportHelper.count(open_prs) { |pr| pr.user.login }
  puts

  puts '=' * 80
  open_issues = repo.issues

  puts "#issues in #{repo_name} opened in the last week"
  puts ReportHelper.count(open_issues)

  puts "#issues by state in #{repo_name} for last week"
  puts ReportHelper.count(repo.issues(state: 'all')) { |i| i.state }

  puts "#issues opened by user in #{repo_name} in last week"
  puts ReportHelper.count(open_issues) { |i| i.user.login }
end

repo_name = 'ResultadosDigitais/rdstation'
repo = Repo.new repo_name

issues = repo.issues

binding.pry
