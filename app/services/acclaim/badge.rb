# frozen_string_literal: true

module Acclaim
  class Badge < Base
    attr_accessor :id, :image_url, :issued_at, :issued_to_first_name, :issued_to_last_name

    def self.list
      # list all issued badges
      response = Request.new('badges').response
      response.fetch('data', []).map { |badge| Badge.new(badge) }
    end

    def self.find(id)
      # retrieve a particular badge
      response = Request.new("badges/#{id}").response
      Badge.new(response.fetch('data'))
    end

    def self.issue(params = {})
      # issue a badge
      response = Request.new('badges', verb: 'post', body: params).response
      Badge.new(response.fetch('data'))
    end

    def initialize(args = {})
      super
      instance_variable_names.each do |attr|
        attribute_name = attr[1..-1]
        parsed_value = args[attribute_name]
        send("#{attribute_name}=", parsed_value)
      end
    end
  end
end
