require 'simplecov'

if ENV['CI']
  SimpleCov.start do
    add_filter ['.bundle', 'config', 'spec']
  end
end

RSpec.configure do |config|
  config.backtrace_exclusion_patterns << /\.bundle/

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end
end
