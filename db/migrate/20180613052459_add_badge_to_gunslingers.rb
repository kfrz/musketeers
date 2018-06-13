# frozen_string_literal: true

class AddBadgeToGunslingers < ActiveRecord::Migration[5.2]
  def change
    add_column :gunslingers, :badge, :jsonb
  end
end
