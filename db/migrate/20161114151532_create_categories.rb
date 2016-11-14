class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :title, null: false, limit: 200 

      t.timestamps(null: false)
    end
  end
end
