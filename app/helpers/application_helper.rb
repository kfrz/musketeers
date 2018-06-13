# frozen_string_literal: true

module ApplicationHelper
  def badge_templates
    Acclaim::BadgeTemplate.list
  end
end
