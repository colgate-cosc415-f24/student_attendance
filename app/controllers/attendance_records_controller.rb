class AttendanceRecordsController < ApplicationController
  before_action :verify_user

  def new
    @student = Student.find(params[:student_id])
    @attendance_record = @student.attendance_records.build
  end

  def create
    @student = Student.find(params[:student_id])
    @attendance_record = @student.attendance_records.build(create_update_params)
    if @attendance_record.save
      flash[:notice] = "Attendance record created"
      respond_to do |format|
        format.html do
          redirect_to student_path(@student) and return
        end
        format.turbo_stream
      end
    else
      flash[:alert] = "Failed to create attendance record"
      render :new, status: :unprocessable_entity
    end
  end

  private
  def create_update_params
    params.require(:attendance_record).permit(:date, :status, :reason, :description)
  end

  def verify_user
    if !current_user || (current_user && current_user.parent?)
      flash[:alert] = "Authorized users only"
      redirect_to students_path
    end
  end
end
