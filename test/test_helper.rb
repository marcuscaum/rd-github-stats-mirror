require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/spec'
require 'webmock/minitest'
require 'vcr'
require 'pry'

require 'rd_github_stats'

Minitest::Reporters.use!

VCR.configure do |c|
  c.cassette_library_dir = 'test/fixtures/cassettes'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
end
