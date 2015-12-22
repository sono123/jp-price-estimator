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
end
