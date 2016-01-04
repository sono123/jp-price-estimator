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
  	@business_card = BusinessCard.find(params[:id])
  end

  def update
    @business_card = BusinessCard.find(params[:id])
    @business_card.update_attributes("price" => params[:business_card][:price], "cost" => params[:business_card][:cost])
    flash[:success] = "Price successfully updated."
    redirect_to root_path
  end

  def search
    search = BusinessCard.search(params)
    result = search[0]
    if result
      @price = result.price.to_s
      @cost = result.cost.to_s
      @id = result.id.to_s
      render :template => 'main/search'
    else
      similar = BusinessCard.similar_products(params)
      @similar = similar.map {|obj| obj[0]}.to_s


      puts "*******************************"
      p @similar
      puts "*******************************"

      render :template => 'main/new_bc'
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
                                          :box_count_id,
  																				:price,
                                          :cost)
  end

end
