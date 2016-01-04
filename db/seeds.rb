# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Print Methods
print_methods = ["pantone offset", "cmyk offset", "letterpress", "digital"]
print_methods.each do |name|
	PrintMethod.create(print_method: name)
end


# Ink Colors
(0..4).each do |front|
	(0..4).each do |back|
		InkColor.create(front: front, back: back)
	end
end


# Bleeds
[true, false].each do |front|
	[true, false].each do |back|
		Bleed.create(front: front, back: back)
	end
end


# Raised Inks
(0..4).each do |front|
	(0..4).each do |back|
		RaisedInk.create(front: front, back: back)
	end
end


# Dimensions
Dimension.create(width: 3.5, height: 2)
Dimension.create(width: 2.5, height: 2.5)
Dimension.create(width: 6, height: 4)


# Paper Types
PaperType.create(brand: "neenah", name: "classic crest", color: "solar white", thickness: 130)
PaperType.create(brand: "neenah", name: "classic crest", color: "natural white", thickness: 130)
PaperType.create(brand: "neenah", name: "classic linen", color: "solar white", thickness: 130)
PaperType.create(brand: "mohawk", name: "strathmore", color: "ultimate white", thickness: 130)
PaperType.create(brand: "mohawk", name: "strathmore", color: "bright white", thickness: 130)
PaperType.create(brand: "mohawk", name: "strathmore", color: "natural white", thickness: 130)


# Coatings
coating_types = [["uv coating", "none"], 
								 ["dull matte", "none"], 
								 ["silk laminate"], 
								 ["suede laminate"], 
								 ["varnish", "none"]] 
coating_types.each do |arr|
	arr.each do |front|
		arr.each do |back|
			Coating.create(front: front, back: back)
		end
	end
end


# Quantities
quantity_increments = [250, 500, 1000, 1500, 2000, 2500]
quantity_increments.each do |qty|
	Quantity.create(quantity: qty)
end


# Box Counts
box_increments = (1..10).to_a
box_increments.each do |qty|
	BoxCount.create(box_count: qty)
end


# Pantone Offset Business Cards
# BusinessCard.create(print_method_id: => 1, 
# 										ink_color_id: => 6, 
# 										bleed_id: => 4, 
# 										raised_ink_id: => 1, 
# 										dimension_id: => 1, 
# 										paper_type_id: => 1, 
# 										coating_id: => 4, 
# 										quantity_id: => 2,
# 	                  box_count_id: => 1,
# 										price: => 139,
# 	                  cost: => 45)

# BusinessCard.create(print_method_id: => 1, 
# 										ink_color_id: => 7, 
# 										bleed_id: => 4, 
# 										raised_ink_id: => 1, 
# 										dimension_id: => 1, 
# 										paper_type_id: => 1, 
# 										coating_id: => 4, 
# 										quantity_id: => 2,
# 	                  box_count_id: => 1,
# 										price: => 159,
# 	                  cost: => 65)







