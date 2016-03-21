class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.integer :budget
      t.string :country

      t.timestamps null: false
    end
  end
end
