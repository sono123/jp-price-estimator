class CreateBusinessCards < ActiveRecord::Migration
  def change
    create_table :business_cards do |t|
      t.integer :price
      t.references :print_method, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
