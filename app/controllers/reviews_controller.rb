class ReviewsController < ApplicationController
	def create
		@product = Product.find(params[:product_id])
		@review = @product.reviews.create(review_params)
		redirect_to product_path(@product)

end

private
   def review_params
   	params.require(:review).permit(:content )
   end
end

# article = product
# review = comment 


# class CommentsController < ApplicationController
#   def create
#     @article = Article.find(params[:article_id])
#     @comment = @article.comments.create(comment_params)
#     redirect_to article_path(@article)
#   end

#   private
#     def comment_params
#       params.require(:comment).permit(:commenter, :body)
#     end
# end