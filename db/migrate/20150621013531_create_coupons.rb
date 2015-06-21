class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.references :album
      t.string :code
      t.boolean :used, :default => false
    end
  end
end
