# frozen_string_literal: true

module Acclaim
  class BadgeTemplate < Base
    attr_accessor :id, :name, :image_url
    # attr_accessor :alignments,
    #               :badge_template_activities,
    #               :badges_count,
    #               :certification,
    #               :created_at,
    #               :criteria_url,
    #               :criteria_url_name,
    #               :description,
    #               :get_issue_count,
    #               :global_activity_url,
    #               :id,
    #               :image,
    #               :image_url,
    #               :name,
    #               :owner,
    #               :public,
    #               :recipient_type,
    #               :recommendations,
    #               :reporting_tags,
    #               :required_badge_templates,
    #               :show_badge_lmi,
    #               :show_lmi_jobs,
    #               :show_skill_tag_links,
    #               :show_template_settings,
    #               :skills,
    #               :state,
    #               :state_updated_at,
    #               :template_type,
    #               :updated_at,
    #               :url,
    #               :vanity_slug

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
