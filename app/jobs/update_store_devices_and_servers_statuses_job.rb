class UpdateStoreDevicesAndServersStatusesJob < ApplicationJob
  queue_as :default

  def perform
    Device.all.each(&:query_status)
    Server.all.each(&:query_status)
    Store.all.each(&:query_status)
  end
end
