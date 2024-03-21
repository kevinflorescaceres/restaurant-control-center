class StoresController < ApplicationController
  def dashboard
    @stores = Store.all.includes(:devices, :servers).order(:id)
  end
end
