class Notification < ApplicationRecord
  belongs_to :source, polymorphic: true

end
