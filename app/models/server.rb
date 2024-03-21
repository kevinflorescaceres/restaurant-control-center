require "net/http"
class Server < ApplicationRecord
  belongs_to :store, dependent: :destroy
  validates :category, :status, presence: true
  validates :category, uniqueness: { scope: :store_id }

  def query_status
    server_online = up?(url)
    if server_online
      status == 'ok' ? update(last_checked: Time.zone.now.to_datetime) : update(status: 'ok', last_checked: Time.zone.now.to_datetime)
    else
      status == 'error' ? update(last_checked: Time.zone.now.to_datetime) : update(status: 'error', last_checked: Time.zone.now.to_datetime)
    end
  end

  private

  def up?(server)
    response = HTTParty.get(server)
    response.code == 200
  rescue Errno::ECONNREFUSED
    false
  end
end
