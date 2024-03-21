class ChangeWebsiteUrlFromStoreToServer < ActiveRecord::Migration[7.1]
  def change
    remove_column :stores, :website_url, :text
    add_column :servers, :url, :text
  end
end
