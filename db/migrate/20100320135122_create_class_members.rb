class CreateClassMembers < ActiveRecord::Migration
  def self.up
    create_table :class_members do |t|
      t.string :first_name
      t.string :last_name
      t.string :suffix
      t.string :class_name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.string :email_address
      t.boolean :verified
      t.number :mailing
      t.text :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :class_members
  end
end
