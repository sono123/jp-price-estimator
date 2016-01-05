class AddMetalToBusinessCards < ActiveRecord::Migration
  def change
    add_reference :business_cards, :metal, index: true, foreign_key: true
  end
end
