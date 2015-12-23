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
  	where(print_method_id: q.print_method, 
  				ink_color_id: q.ink_color, 
  				bleed_id: q.bleed, 
  				raised_ink_id: q.raised_ink,
  				dimension_id: q.dimension,
  				paper_type_id: q.paper_type,
  				coating_id: q.coating,
  				quantity_id: q.quantity
  				)
  end
end
