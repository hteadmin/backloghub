require 'simplecov'
SimpleCov.start 'rails' do
  add_group "Services", "app/services"
end

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'mocha/mini_test'
require 'minitest/reporters'

# reporter_options = { color: true }
# Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class ActiveSupport::TestCase

  # Add more helper methods to be used by all tests here...
  include FactoryGirl::Syntax::Methods

end
