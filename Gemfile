source "http://rubygems.org"

gem 'spree_chilexpress_shipping', path: '/vagrant/spree_chilexpress_shipping'
gemspec

group :test do
  gem 'sass-rails', '~> 4.0.0'
  gem 'coffee-rails', '~> 4.0.0'

  if RUBY_PLATFORM.downcase.include? "darwin"
    gem 'rb-fsevent'
    gem 'growl'
    gem 'guard-rspec'
  end
end

gem 'devise'
gem 'devise-encryptable'
gem 'spree_auth_devise', :github => "spree/spree_auth_devise", :branch => "2-1-stable"
# gem 'spree', '~> 2.1.4'