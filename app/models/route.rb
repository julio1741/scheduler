class Route < ApplicationRecord
  belongs_to :user_id
  scope :not_resolved_routes, where(resolved: false)
end
