class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_salt
      t.string :password_hash 
      t.string :kijiji_user 
      t.string :kijiji_password 
      t.boolean :admin
      t.boolean :indian

      t.timestamps
    end
  end
end
