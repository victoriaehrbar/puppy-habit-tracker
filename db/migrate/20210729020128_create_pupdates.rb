class CreatePupdates < ActiveRecord::Migration[5.2]
  def change
    create_table :pupdates do |t|
      t.string :title
      t.string :content
      t.integer :user_id

      t.timestamps null: false
    end
  end
end