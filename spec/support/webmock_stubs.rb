# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:each) do
    # stub_request(:post, %r{\Ahttp://www.example.com/foo/\d+/bar\z})
    stub_request(:get, /sandbox.youracclaim.com/)
      .with(
        headers: {
          'Accept' => 'application/json',
          'Connection' => 'close',
          'Host' => 'sandbox.youracclaim.com',
          'User-Agent' => 'http.rb/3.3.0'
        }
      )
      .to_return(status: 200, body: body_contents.to_json, headers: {})

    stub_request(:post, /sandbox.youracclaim.com/)
      .with(
        headers: {
          'Accept' => 'application/json',
          'Connection' => 'close',
          'Host' => 'sandbox.youracclaim.com',
          'User-Agent' => 'http.rb/3.3.0'
        },
        body: {}
      )
      .to_return(status: 201, body: body_contents.to_json, headers: {})
  end
end

def body_contents
  { data: {} }
end
