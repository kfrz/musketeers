# frozen_string_literal: true

module Acclaim
  class Connection
    def self.api
      authenticated_api_connection
    end

    def self.authenticated_api_connection
      basic_auth.headers(accept: 'application/json')
    end

    def self.basic_auth
      HTTP.basic_auth(user: user_auth_token, pass: '')
    end

    def self.user_auth_token
      credentials.acclaim_user_auth_token
    end

    def self.credentials
      Rails.application.credentials
    end
  end
end
