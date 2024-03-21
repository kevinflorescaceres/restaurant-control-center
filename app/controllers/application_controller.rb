class ApplicationController < ActionController::Base
  def welcome
    @stores = Store.all.includes(:devices, :servers).order(:id)
  end
end
