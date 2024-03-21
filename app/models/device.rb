class Device < ApplicationRecord
  belongs_to :store, dependent: :destroy
  validates :category, :status, presence: true
  validates :category, uniqueness: { scope: :store_id }

  enum :status, { 'ok': 0, 'error': 1 }

  HUMAN_STATUS = {
    'ok' => 'Ok',
    'error' => 'Error'
  }.freeze

  def query_status
    if status == 'ok'
      might_disconnect
    else
      might_connect
    end
    update(last_checked: Time.zone.now.to_datetime)
  end

  private

  def might_disconnect
    update(status: 'error') if rand(100) >= 95
  end

  def might_connect
    update(status: 'ok') if rand(100) >= 65
  end
end
