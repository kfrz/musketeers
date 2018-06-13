# frozen_string_literal: true

module Acclaim
  class Request
    attr_reader :body, :connection, :endpoint, :verb

    BASE_URL = 'https://sandbox.youracclaim.com/api/v1/organizations/'

    def initialize(endpoint, verb: 'get', body: {})
      @body = body
      @connection = Connection.api
      @endpoint = endpoint
      @verb = verb
    end

    def response
      JSON.parse(http_response.to_s)
    end

    private

    def http_response
      body.present? ? connection.send(verb.to_sym, url, json: body) : connection.send(verb.to_sym, url)
    end

    def url
      "#{api_url}/#{endpoint}"
    end

    def api_url
      BASE_URL + credentials.acclaim_organization_id
    end

    def credentials
      Rails.application.credentials
    end
  end
end
