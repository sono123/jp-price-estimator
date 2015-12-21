class AddBleedToBusinessCards < ActiveRecord::Migration
  def change
    add_reference :business_cards, :bleed, index: true, foreign_key: true
  end
end
