class BusinessCard < ActiveRecord::Base
  belongs_to :print_method
  belongs_to :ink_color
  belongs_to :bleed
  belongs_to :raised_ink
  belongs_to :dimension
  belongs_to :paper_type
  belongs_to :coating
  belongs_to :quantity

  def self.search(q)
  	puts "REACHED BUSINESS-CARD SEARCH CLASS METHOD****************"
  	result = where("print_method_id = ? AND ink_color_id = ? AND bleed_id = ? AND raised_ink_id = ? AND dimension_id = ? AND paper_type_id = ? AND coating_id = ? AND quantity_id = ?", q['print_method_id'], q['ink_color_id'], q['bleed_id'], q['raised_ink_id'], q['dimension_id'], q['paper_type_id'], q['coating_id'], q['quantity_id'])
  	p "*******************reached result****************"
  	p result
  end
end





# print_method_id: q['print_method_id'], 
# ink_color_id: q['ink_color_id'], 
# bleed_id: q['bleed_id'], 
# raised_ink_id: q['raised_ink_id'],
# dimension_id: q['dimension_id'],
# paper_type_id: q['paper_type_id'],
# coating_id: q['coating_id'],
# quantity_id: q['quantity_id']