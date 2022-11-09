class FavoritesController < ApplicationController
  def index
  	@favorites = Favorite.where(user_id: current_user.id)
  end 

  def delete
	product = Product.find(params[:id])
	product.destroy
	redirect_to favorite_path
  end
end
