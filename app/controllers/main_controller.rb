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
  	result = search[0]
  	if result
	  	@price = result.price.to_s
      @cost = result.cost.to_s
	  	@id = result.id.to_s
  	else
  		render :template => 'main/new_bc'
  	end
  end

end























