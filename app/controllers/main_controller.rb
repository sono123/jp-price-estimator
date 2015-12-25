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
  	if @result
	  	@price = @result.price.to_s
  	else
  		render :template => 'main/new_bc'
  	end
  end

  def create
  	search = BusinessCard.search(params["business_card"])
  	@result = search[0]
  	if @result
  		flash[:error] = "That item is already in the system."
  		redirect_to root_path
  	else
	  	BusinessCard.create(business_card_params)
	  	flash[:success] = "Price successfully added."
	  	redirect_to root_path
  	end
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























