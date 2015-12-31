class AddBoxCountToBusinessCards < ActiveRecord::Migration
  def change
    add_reference :business_cards, :box_count, index: true, foreign_key: true
  end
end
