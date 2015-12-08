class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.integer :point
      t.text :description
      t.integer :state

      t.timestamps null: false
    end
  end
end
