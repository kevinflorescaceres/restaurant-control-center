# frozen_string_literal: true

# Clase Tienda, la cual mostrará su estado a través del estado de sus dispositivos y servidores
class Store < ApplicationRecord
  validates :name, :category, :status, :photo_url, presence: true
end
