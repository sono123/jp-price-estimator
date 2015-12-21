class AddCoatingToBusinessCards < ActiveRecord::Migration
  def change
    add_reference :business_cards, :coating, index: true, foreign_key: true
  end
end
