# frozen_string_literal: true

# Clase Tienda, la cual mostrará su estado a través del estado de sus dispositivos y servidores
class Store < ApplicationRecord
  has_many :devices
  has_many :servers
  validates :name, :category, :status, :photo_url, presence: true

  def printer
    devices.find_by(category: 'printer')
  end

  def web
    servers.find_by(category: 'web')
  end

  def database
    servers.find_by(category: 'database')
  end
end
