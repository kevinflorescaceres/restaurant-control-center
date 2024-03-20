class CreateStores < ActiveRecord::Migration[7.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :category
      t.string :status
      t.datetime :last_checked
      t.string :photo_url

      t.timestamps
    end
  end
end
