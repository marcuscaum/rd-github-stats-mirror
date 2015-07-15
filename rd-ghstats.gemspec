Gem::Specification.new do |s|
  s.name = 'rd-ghstats'
  s.version = '0.0.0'
  s.summary = 'RD Github stats'
  s.description = 'Github stats for RD projects.'
  #s.homepage = 'https://github.com/ResultadosDigitais/rd-ghstats
  s.author = 'ResutadosDigitais'
  #s.email = ''
  s.files = `git ls-files`.split($/) # Ensures that only versioned files are used
  #s.license = 'MIT'

  s.add_runtime_dependency "octokit"
  s.add_runtime_dependency "activesupport", "~> 4.2"

  s.add_development_dependency "bundler", "~> 1.8"
  s.add_development_dependency "rake", "~> 10.4"
  s.add_development_dependency "minitest", "~> 5.5"
  s.add_development_dependency "minitest-reporters", "~> 1.0"
  s.add_development_dependency "vcr", "~> 2.9.3"
  s.add_development_dependency "webmock", '~> 1.21'
  s.add_development_dependency "pry"
end
