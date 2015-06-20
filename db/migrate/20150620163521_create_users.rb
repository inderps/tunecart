class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :about_us
      t.string :fb_link
      t.string :website
      t.string :soundcloud_link
    end
  end
end
