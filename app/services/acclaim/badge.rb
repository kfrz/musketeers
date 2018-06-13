# frozen_string_literal: true

module Acclaim
  class Badge < Base
    attr_accessor :id, :image_url, :issued_at, :issued_to_first_name, :issued_to_last_name
    # attr_accessor :accept_badge_url,
    #               :alignments,
    #               :badge_template,
    #               :country,
    #               :created_at,
    #               :created_by,
    #               :evidence,
    #               :expires_at,
    #               :expires_at_date,
    #               :id,
    #               :image,
    #               :image_url,
    #               :issued_at,
    #               :issued_at_date,
    #               :issued_to,
    #               :issued_to_first_name,
    #               :issued_to_last_name,
    #               :issuer,
    #               :issuer_earner_id,
    #               :locale,
    #               :printing_enabled,
    #               :public,
    #               :recipient_email,
    #               :replacement_badge_id,
    #               :revocation_reason,
    #               :state,
    #               :state_or_province,
    #               :state_updated_at,
    #               :suppress_badge_notification_email,
    #               :updated_at,
    #               :user

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
