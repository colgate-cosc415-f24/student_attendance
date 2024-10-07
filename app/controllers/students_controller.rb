class StudentsController < ApplicationController
  def index
    @students = Student.all.order(:last)
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end
end
