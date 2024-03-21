# frozen_string_literal: true

# Clase Tienda, la cual mostrará su estado a través del estado de sus dispositivos y servidores
class Store < ApplicationRecord
  has_many :devices
  has_many :servers
  validates :name, :category, :status, :photo_url, presence: true

  enum :status, { 'ok': 0, 'warning': 1, 'error': 2 }

  HUMAN_STATUS = {
    'ok' => 'Ok',
    'warning' => 'Advertencia',
    'error' => 'Error'
  }.freeze

  def printer
    devices.find_by(category: 'printer')
  end

  def web
    servers.find_by(category: 'web')
  end

  def database
    servers.find_by(category: 'database')
  end

  def query_status
    if printer.status == 'ok' && servers.all? { |server| server.status == 'ok' }
      status == 'ok' ? update(last_checked: Time.zone.now.to_datetime) : update(status: 'ok', last_checked: Time.zone.now.to_datetime)
    elsif printer.status == 'error' && servers.all? { |server| server.status == 'error' }
      status == 'error' ? update(last_checked: Time.zone.now.to_datetime) : update(status: 'error', last_checked: Time.zone.now.to_datetime)
    else
      status == 'warning' ? update(last_checked: Time.zone.now.to_datetime) : update(status: 'warning', last_checked: Time.zone.now.to_datetime)
    end
  end
end
