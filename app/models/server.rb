class Server < ApplicationRecord
  belongs_to :store, dependent: :destroy
  validates :category, :status, presence: true
  validates :category, uniqueness: { scope: :store_id }
end
