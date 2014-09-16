class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.integer :user_id
      t.string :link
      t.time :repost_time
      t.boolean :done
      t.datetime :last_repost

      t.timestamps
    end
  end
end
