# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :source, polymorphic: true
      t.boolean :read, default: false
      t.timestamps
    end
  end
end
