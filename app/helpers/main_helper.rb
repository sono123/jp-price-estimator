module MainHelper
	def print_methods
		@print_methods.map{ |m| [m.print_method, m.id] }
	end

	def ink_colors
		@ink_colors.map do |i|
			[i.front.to_s + "/" + i.back.to_s, i.id]
		end
	end

	def bleeds
		@bleeds.map do |i|
			front = ""
			back = ""

			if i.front == true
				front << "1"
			else
				front << "0"
			end

			if i.back == true
				back << "1"
			else
				back << "0"
			end

			[front + "/" + back, i.id]
		end
	end

	def raised_inks
		@raised_inks.map do |i|
			[i.front.to_s + "/" + i.back.to_s, i.id]
		end
	end

	def trim(num)
		int = num.to_i
		flot = num
		int == flot ? int : flot
	end

	def dimensions
		@dimensions.map do |i|
			[trim(i.width).to_s + " x " + trim(i.height).to_s, i.id]
		end
	end

	def paper_types
		@paper_types.map do |i|
			[i.brand + " - " + i.name + " - " + i.color + " - " + i.thickness.to_s + "lb", i.id]
		end
	end

	def coatings
		@coatings.map do |i|
			[i.front + " / " + i.back, i.id]
		end
	end

	def quantities
		@quantities.map do |i|
			[i.quantity, i.id]
		end
	end

	def box_counts
		@box_counts.map do |i|
			[i.box_count, i.id]
		end
	end

	def overhead
		if @price.to_i < 120
			"35"
		else
			"45"
		end
	end

	def margin
		@margin = @price.to_i - (@cost.to_i + overhead.to_i)
		@margin.to_s
	end

	def similar_products(arr_string)
		if arr_string
			arr_string.slice!(0)
			arr_string.chop
			arr = arr_string.split(",").map(&:to_i)
			html_string = "<div class='similar-products'><br><h3>Similar Products</h3><br><br>"
			
			arr.each do |id|
				bc = BusinessCard.find(id)
				html_string << "<h5>Print Method: #{bc.print_method.print_method}</h5>"
				html_string << "<h5>Ink Colors: #{bc.ink_color.front} / #{bc.ink_color.back}</h5>"
				html_string << "<h5>Bleeds: #{bc.bleed.front ? 1 : 0} / #{bc.bleed.back ? 1 : 0}</h5>"
				html_string << "<h5>Raised Inks: #{bc.raised_ink.front} / #{bc.raised_ink.back}</h5>"
				html_string << "<h5>Dimensions: #{trim bc.dimension.width} x #{trim bc.dimension.height}</h5>"
				html_string << "<h5>Coatings: #{bc.coating.front} / #{bc.coating.back}</h5>"
				html_string << "<h5>Quantity: #{bc.quantity.quantity}</h5>"
				html_string << "<h5>Box Count: #{bc.box_count.box_count}</h5>"
				html_string << "<h5>Unit Price: $#{bc.price}</h5>"
				html_string << "<br><br>"
			end

			html_string << "</div>"
			html_string.html_safe
		end
	end
end
















