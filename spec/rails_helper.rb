# frozen_string_literal: true

if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start 'rails'
end

ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../config/environment', __dir__)
abort('Rails is in Production environment!') if Rails.env.production?

require 'rspec/rails'
require 'shoulda/matchers'
require 'capybara/rails'

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |file| require file }

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.infer_base_class_for_anonymous_controllers = false
  config.use_transactional_fixtures = false
  config.filter_rails_from_backtrace!
  config.infer_spec_type_from_file_location!

  # Enable the use of 't' in specs instead of I18n.t
  config.include AbstractController::Translation
end

ActiveRecord::Migration.maintain_test_schema!
