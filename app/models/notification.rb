# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :source, polymorphic: true, dependent: :destroy
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
end
