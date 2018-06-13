# frozen_string_literal: true

module Acclaim
  class BadgeTemplate < Base
    attr_accessor :id, :name, :image_url

    def self.list
      # list all badge templates
      response = Request.new('badge_templates').response
      response.fetch('data', []).map { |template| BadgeTemplate.new(template) }
    end

    def self.find(id)
      # find a particular badge template
      response = Request.new("badge_templates/#{id}").response
      BadgeTemplate.new(response.fetch('data'))
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
