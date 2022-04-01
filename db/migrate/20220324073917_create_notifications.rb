# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :sender
      t.references :recipient
      t.references :source, polymorphic: true
      t.boolean :read, default: false
      t.timestamps
    end

    add_foreign_key :notifications, :users, column: :sender_id, primary_key: :id
    add_foreign_key :notifications, :users, column: :recipient_id, primary_key: :id
  end
end
