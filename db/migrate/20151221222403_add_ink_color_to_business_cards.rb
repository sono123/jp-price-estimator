class AddInkColorToBusinessCards < ActiveRecord::Migration
  def change
    add_reference :business_cards, :ink_color, index: true, foreign_key: true
  end
end
