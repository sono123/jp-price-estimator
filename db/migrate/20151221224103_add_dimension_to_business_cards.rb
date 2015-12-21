class AddDimensionToBusinessCards < ActiveRecord::Migration
  def change
    add_reference :business_cards, :dimension, index: true, foreign_key: true
  end
end
