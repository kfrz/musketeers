# frozen_string_literal: true

class BadgeIssuanceService
  def initialize(params = {})
    @params = params
  end

  def call
    issue_badge!
  end

  private

  def issue_badge!
    badge = Acclaim::Badge.issue(badge_params)
    gunslinger.update(acclaimed: true, badge: badge.as_json)
  end

  def badge_params
    {
      "recipient_email": gunslinger.email,
      "badge_template_id": @params[:badge_template_id],
      "issued_at": Time.zone.now,
      "issued_to_first_name": gunslinger.first_name,
      "issued_to_last_name": gunslinger.last_name,
      "suppress_badge_notification_email": true
    }
  end

  def gunslinger
    Gunslinger.find(@params[:id])
  end
end
