Gem::Specification.new do |s|
  s.name = 'rd-github-stats'
  s.version = '0.0.0'
  s.summary = 'RD Github Stats'
  s.description = 'Simple reports for your Github projects.'
  s.homepage = 'https://github.com/ResultadosDigitais/rd-github-stats'
  s.author = 'ResutadosDigitais'
  s.email = ''
  s.files = `git ls-files`.split($/) # Ensures that only versioned files are used
  s.license = 'MIT'

  s.add_runtime_dependency "octokit", "~> 4.0"
  s.add_runtime_dependency "activesupport", "~> 4.2"

  s.add_development_dependency "bundler", "~> 1.8"
  s.add_development_dependency "rake", "~> 10.4"
  s.add_development_dependency "minitest", "~> 5.5"
  s.add_development_dependency "minitest-reporters", "~> 1.0"
  s.add_development_dependency "vcr", "~> 2.9"
  s.add_development_dependency "webmock", '~> 1.21'
  s.add_development_dependency "pry", "~> 0.10"
end
