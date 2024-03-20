class Device < ApplicationRecord
  belongs_to :store, dependent: :destroy
  validates :category, :status, presence: true
end
