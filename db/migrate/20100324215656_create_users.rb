class CreateUsers < ActiveRecord::Migration

  def self.up
    create_table :users, :force => true do |t|
      t.string   :username, :null => false
      t.string   :password, :null => false
      t.datetime :expires
      t.datetime :last_password_change
      t.boolean  :force_password_change
      t.boolean  :enabled
      t.timestamps
    end
    add_index :users, [:username], :name => :users_username_idx
  end

  def self.down
    drop_index :users_username_idx
    drop_table :users
  end

end
