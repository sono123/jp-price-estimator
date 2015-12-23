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
end
















