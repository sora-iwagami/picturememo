class OrderHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :order_histories do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.timestamps null: false
    end
  end
end
