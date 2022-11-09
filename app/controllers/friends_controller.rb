class FriendsController < ApplicationController
  def index
  	@friend = Friend.paginate(page: params[:page],per_page:3)
  end


  def new
  	@friend = Friend.new
  end


	def create
		@friend = Friend.new(first_name: params[:friend][:first_name], last_name:  params[:friend][:last_name],email:  params[:friend][:email], gender:  params[:friend][:gender], phone_no: params[:friend][:phone_no])
		if @friend.save
  		redirect_to friend_path(@friend)
  	else
  		render :new, status: :unprocessable_entity
  	end
	end	

  def show
  	@friend = Friend.find(params[:id])
  end


  def edit
  	@friend = Friend.find(params[:id])
  end

  def update
    @friend = Friend.find(params[:id])
  	 respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to friend_url(@friend), notice: "friend was successfully updated." }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
     @friend = Friend.find(params[:id])
    @friend.destroy
    respond_to do |format|
      format.html{redirect_to friends_url, notice: "friend was successfully destroyed."}
      format.json{head :no_content }
    end
  end

    private
    def  friend_params
      params.require(:friend).permit(:first_name, :last_name, :email, :gender, :phone_no)
  end

end
