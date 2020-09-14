class CreateProductPromotions < ActiveRecord::Migration[6.0]
  def change
    create_table :product_promotions do |t|
      t.references :promotion_category, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
