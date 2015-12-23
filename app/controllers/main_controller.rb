class MainController < ApplicationController
  def index
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
  	@result = BusinessCard.search(params)
  	redirect_to root_path
  end
end
