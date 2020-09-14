class CreatePromotionCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :promotion_categories do |t|
      t.string :name
      t.integer :promotion_type
      t.json :rules

      t.timestamps
    end
  end
end
