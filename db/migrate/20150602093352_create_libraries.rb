class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.string :title
      t.text :content
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
