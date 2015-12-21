class AddRaisedInkToBusinessCards < ActiveRecord::Migration
  def change
    add_reference :business_cards, :raised_ink, index: true, foreign_key: true
  end
end
