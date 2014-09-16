class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.email :string
      t.password_salt :string
      t.password_hash :string
      t.kijiji_user :string
      t.kijiji_password :string

      t.timestamps
    end
  end
end
