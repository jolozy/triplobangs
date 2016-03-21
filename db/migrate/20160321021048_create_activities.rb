class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :type
      t.string :description
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
