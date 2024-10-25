class StudentsController < ApplicationController
  def index
    searchfield = params[:name_search]
    @students = if params[:name_search]
      @students = Student.name_search(searchfield)
    else
      @students = Student.all
    end
    @students = @students.order(:last)
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(create_params) # "mass assignment" of attributes!
    if @student.save
      flash[:notice] = "Student #{@student.name} successfully created"
      redirect_to students_path
    else
      flash[:alert] = "Student couldn't be created"
      render :new, status: :unprocessable_entity

      # could also redirect_to new_student_path but rendering directly
      # to 'new' allows existing values in @student to be shown in form
      # for user to edit, as well as validation errors
    end
  end

  # controller methods
  def edit
    @student = Student.find params[:id]
  end

def update
  @student = Student.find params[:id]
  @student.update(create_params)
  flash[:notice] = "#{@student.name} was successfully updated."
  redirect_to student_path(@student)
end

def destroy
  @student = Student.find(params[:id])
  @student.destroy
  flash[:alert] = "Student '#{@student.name}' deleted."
  redirect_to students_path
end

  private

  def create_params
    params.require(:student).permit(:first, :last, :homeroom, :graduation_year)
  end
end
