# frozen_string_literal: true

class Gunslinger < ApplicationRecord
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.acclaimed
    where(acclaimed: true)
  end

  def full_name
    first_name + ' ' + last_name
  end
end
