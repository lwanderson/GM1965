class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations do |t|
      t.string :first_name
      t.string :mi
      t.string :last_name
      t.string :suffix
      t.string :class_name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :province
      t.string :country
      t.string :email
      t.string :gm_street
      t.string :gm_colors
      t.string :gm_PIAA
      t.string :class_colors
      t.string :class_motto
      t.string :class_flower
      t.string :class_size
      t.boolean :processed
      t.timestamps
    end
    add_index :registrations, [:email], :name => :registrations_email_idx
  end

  def self.down
    remove_index :registrations, :name => :registrations_email_idx
    drop_table :registrations
  end
end
