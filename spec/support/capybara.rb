# frozen_string_literal: true

require 'selenium/webdriver'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :headless_chrome do |app|
  opts = if ENV['DISABLE_HEADLESS']
           { args: %w[no-sandbox disable-gpu] }
         else
           { args: %w[headless no-sandbox disable-gpu] }
         end

  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: opts
  )

  Capybara::Selenium::Driver.new app,
                                 browser: :chrome,
                                 desired_capabilities: capabilities
end

Capybara.javascript_driver = :headless_chrome
