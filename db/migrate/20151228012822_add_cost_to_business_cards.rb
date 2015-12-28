class AddCostToBusinessCards < ActiveRecord::Migration
  def change
    add_column :business_cards, :cost, :integer
  end
end
