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

repo_name = 'ResultadosDigitais/rdstation'
repo = Repo.new repo_name
client = Octokit.client

binding.pry
