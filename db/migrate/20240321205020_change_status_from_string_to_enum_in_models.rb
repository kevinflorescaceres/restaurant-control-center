class ChangeStatusFromStringToEnumInModels < ActiveRecord::Migration[7.1]
  def change
    Store.where(status: 'ok').update_all(status: 0)
    Store.where(status: 'warning').update_all(status: 1)
    Store.where(status: 'error').update_all(status: 2)
    Device.where(status: 'ok').update_all(status: 0)
    Device.where(status: 'error').update_all(status: 1)
    Server.where(status: 'ok').update_all(status: 0)
    Server.where(status: 'error').update_all(status: 1)
    reversible do |direction|
      change_table :stores do |t|
        direction.up    { t.change :status, 'integer USING CAST(status AS integer)' }
        direction.down  { t.change :status, :string }
      end
      change_table :devices do |t|
        direction.up    { t.change :status, 'integer USING CAST(status AS integer)' }
        direction.down  { t.change :status, :string }
      end
      change_table :servers do |t|
        direction.up    { t.change :status, 'integer USING CAST(status AS integer)' }
        direction.down  { t.change :status, :string }
      end
    end
  end
end
