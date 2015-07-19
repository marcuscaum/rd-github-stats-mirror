require 'rspec'
require 'rspec/mocks'
require 'rspec/expectations'
require 'webmock'
require 'webmock/rspec'
require 'vcr'
require 'pry'
require 'yaml'

require 'rd_github_stats'

RSpec.configure do |c|
  c.order = :random
  c.mock_with :rspec

  WebMock.disable_net_connect!
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
end

def load_response(name)
  setup_response(YAML.load_file("spec/fixtures/#{name}.yml"))
end

def setup_response(array)
  array.map do |el|
    convert_to_response(el)
  end
end

def convert_to_response(hash)
  hash.each_with_object(OpenStruct.new) do |h, response|
    key = h[0]; value = h[1]
    if value.is_a? Hash
      response[key] = convert_to_response(value)
    else
      response[key] = value
    end
  end
end
