class StoresController < ApplicationController
  def dashboard
    @stores = Store.all.includes(:devices, :servers).order(:id)
  end

  def update
    @store = Store.find(params[:id])
  end

  def show
    @store = Store.find(params[:id])
    render partial: 'stores/store', locals: { store: @store }
  end
end
