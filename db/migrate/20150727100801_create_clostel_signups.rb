class CreateClostelSignups < ActiveRecord::Migration
  def change
    create_table :clostel_signups do |t|
      t.string :version
      t.string :ip_address
      t.integer :visited_count, :default => 0
      t.string :entered_email
      t.string :hostel_name
      t.string :city
      t.string :current_app
      t.string :query
    end
  end
end
