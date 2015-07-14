require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/spec'
require 'webmock/minitest'
require 'vcr'
require 'pry'

require 'rd_ghstats'

Minitest::Reporters.use!

Github.configure do |c|
  c.basic_auth = 'lucasandre:575f946dfb6be40d3672c8d4776814436e6dc4b4'
  c.user = 'ResultadosDigitais'
  c.org = 'ResultadosDigitais'
end

VCR.configure do |c|
  c.cassette_library_dir = 'test/fixtures/cassettes'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
end
