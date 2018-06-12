# frozen_string_literal: true

class CreateGunslingers < ActiveRecord::Migration[5.2]
  def change
    create_table :gunslingers do |t|
      t.string :email,      null: false, default: ''
      t.string :first_name, null: false, default: ''
      t.string :last_name,  null: false, default: ''
      t.boolean :acclaimed, default: false
      t.timestamps
    end
  end
end
