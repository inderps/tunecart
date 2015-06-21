class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.references :user
    end
  end
end
