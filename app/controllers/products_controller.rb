class ProductsController < ApplicationController
	 def index
  	@products = Product.paginate(page: params[:page], per_page: 10)
  end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(name: params[:product][:name], description:  params[:product][:description], image: params[:product][:image], price: params[:product][:price] )
		if @product.save
  		redirect_to product_path(@product)
  	else
  		render :new, status: :unprocessable_entity
  	end
	end	

  def show
  	@product = Product.find(params[:id])
  end

  def add_favorite
    @product = Product.find_by(id: params[:product_id])
    @favorite = Favorite.create(user_id: current_user.id, product_id: @product.id)
    redirect_to product_url(@product), notice: "Successfully added your favorite list."
  end

  def remove_favorite
    @product = Product.find_by(id: params[:product_id])
    favorite = Favorite.where(user_id: current_user.id, product_id: @product.id).last
    if favorite.present?
      favorite.destroy
      redirect_to product_url(@product), notice: "Successfully removed your favorite list."
    end
  end


  def edit
   @product = Product.find(params[:id])
  end

  def update

    @product = Product.find(params[:id])
  	 respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
     @product = Product.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html{redirect_to products_url, notice: "product was successfully destroyed."}
      format.json{head :no_content }
    end
  end
  

  private
    def  product_params
      params.require(:product).permit(:name, :description, :image, :price)
    end

end
