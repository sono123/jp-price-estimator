class MainController < ApplicationController
  def index
  	@result = flash[:result]
  	@business_card = BusinessCard.new
  	@print_methods = PrintMethod.all
  	@ink_colors = InkColor.all
  	@bleeds = Bleed.all
  	@raised_inks = RaisedInk.all
  	@dimensions = Dimension.all
  	@paper_types = PaperType.all
  	@coatings = Coating.all
  	@quantities = Quantity.all
  end

  def search
  	search = BusinessCard.search(params)
  	@result = search[0]
  	@price = @result.price.to_s
  	if @result
  		puts "*************@RESULT IN CONTROLLER **************"
  		p @result.price
  		puts "***************************"
  		flash[:result] = @result
  		# redirect_to root_path # with ajax eventually
  	else
  		# use ajax to alter the form HTML without deleting the values
  	end
  end

  def create
  	@business_card = BusinessCard.create(business_card_params)
  	redirect_to root_path # with ajax eventually
  end

  private

  def business_card_params
  	params.require(:business_card).permit(:print_method_id, 
  																				:ink_color_id, 
  																				:bleed_id, 
  																				:raised_ink_id, 
  																				:dimension_id, 
  																				:paper_type_id, 
  																				:coating_id, 
  																				:quantity_id,
  																				:price)
  end

end

























