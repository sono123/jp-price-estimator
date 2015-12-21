class AddQuantityToBusinessCards < ActiveRecord::Migration
  def change
    add_reference :business_cards, :quantity, index: true, foreign_key: true
  end
end
