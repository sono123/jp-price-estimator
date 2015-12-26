class BusinessCardsController < ApplicationController

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

  def edit
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
