require File.dirname(__FILE__) + '/lib/indeed_api/version'

spec = Gem::Specification.new do |s|
  
  s.name = 'indeed_api'
  s.author = 'John Crepezzi'
  s.add_development_dependency('rspec')
  s.add_dependency('httparty', '~> 0.7.3')
  s.description = 'Ruby wrapper for the Indeed Job search API'
  s.email = 'john.crepezzi@patch.com'
  s.files = Dir['lib/**/*.rb']
  s.has_rdoc = true
  s.homepage = 'http://seejohnrun.github.com/indeed/'
  s.platform = Gem::Platform::RUBY
  s.require_paths = ['lib']
  s.summary = 'Ruby wrapper for the Indeed Job API'
  s.test_files = Dir.glob('spec/*.rb')
  s.version = IndeedAPI::VERSION
  s.rubyforge_project = 'indeed_api'

end
