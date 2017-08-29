class RenameBackgroundImageUrlColumnToUsers < ActiveRecord::Migration
  def change

  	rename_column :users, :background_image_url, :banner_url

  end
end
