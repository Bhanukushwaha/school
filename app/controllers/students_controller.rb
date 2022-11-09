class StudentsController < ApplicationController
  def index
  	@students = Student.paginate(page: params[:page], per_page: 10)
  end

  def new
  	@student = Student.new
  end

  def create 
  	@student =  Student.new(name: params[:student][:name], email: params[:student][:email], rollno: params[:student][:rollno], gender: params[:student][:gender], city: params[:student][:city] ,address: params[:student][:address],start_date:params[:student][:start_date], end_date: params[:student][:end_date])
  	if @student.save
  		redirect_to student_path(@student)
  	else
  		render :new, status: :unprocessable_entity
  	end
  end

  def show
    @student = Student.find_by(id: params[:id])
    if @student.present?
    else
      redirect_to students_path
    end
  end

  def student_details
    @bhanu = Student.find(params[:id]) 
  end

  def edit
   @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
  	 respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to student_url(@student), notice: "student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
     @student = Student.find(params[:id])
    @student.destroy
    respond_to do |format|
      format.html{redirect_to students_url, notice: "student was successfully destroyed."}
      format.json{head :no_content }
    end
  
  end
  private
    def  student_params
      params.require(:student).permit(:name, :email, :rollno, :gender, :city , :address, :start_date, :end_date)
    end
end
