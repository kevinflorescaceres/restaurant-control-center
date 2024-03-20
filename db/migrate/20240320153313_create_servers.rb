class CreateServers < ActiveRecord::Migration[7.1]
  def change
    create_table :servers do |t|
      t.string :category
      t.string :status
      t.datetime :last_checked

      t.timestamps
    end
  end
end
