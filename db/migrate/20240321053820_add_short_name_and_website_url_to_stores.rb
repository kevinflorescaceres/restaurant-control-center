class AddShortNameAndWebsiteUrlToStores < ActiveRecord::Migration[7.1]
  def change
    add_column :stores, :short_name, :string
    add_column :stores, :website_url, :text
  end
end
