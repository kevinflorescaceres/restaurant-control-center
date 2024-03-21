class AddStoreReferenceToDevicesAndServers < ActiveRecord::Migration[7.1]
  def change
    add_reference :devices, :store
    add_reference :servers, :store
  end
end
