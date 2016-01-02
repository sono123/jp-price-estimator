class MainController < ApplicationController
  before_action :authenticate_user!

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
    @box_counts = BoxCount.all
  end

  def search
  	search = BusinessCard.search(params)
  	result = search[0]
  	if result
	  	@price = result.price.to_s
      @cost = result.cost.to_s
	  	@id = result.id.to_s
  	else
      # BusinessCard.similar_products(params)
  		render :template => 'main/new_bc'
  	end
  end

end























