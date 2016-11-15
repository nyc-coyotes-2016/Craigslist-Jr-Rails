class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.integer :price, null: false
      t.string :location, null: false
      t.text :description, null: false, limit: 1000
      t.string :reference_url, null: false
      t.string :email, null: false 
      t.integer :category_id, null: false

      t.timestamps(null: false)
    end
  end
end
