class AddPaperTypeToBusinessCards < ActiveRecord::Migration
  def change
    add_reference :business_cards, :paper_type, index: true, foreign_key: true
  end
end
