# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_chilean_shipping'
  s.version     = '2.1.4'
  s.summary     = 'Add support for chilean shipping methods'
  s.description = 'Add support for chilean shipping methods like citybox and chilexpress'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Acid Labs'
  s.email     = 'gmoreno@acid.cl'
  s.homepage  = 'http://www.acid.cl'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.1.4'
  s.add_dependency 'spree_frontend', '~> 2.1.4'
  s.add_dependency 'write_xlsx', '~> 0.76.0'

  s.add_development_dependency 'capybara', '~> 2.1'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.2'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.13'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
