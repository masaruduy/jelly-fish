class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.integer :user_id
      t.string :link
      t.time :repost
      t.boolean :done

      t.timestamps
    end
  end
end
