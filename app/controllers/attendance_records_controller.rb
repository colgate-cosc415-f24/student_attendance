class AttendanceRecordsController < ApplicationController
  def new
    @student = Student.find(params[:student_id])
    @attendance_record = @student.attendance_records.build
  end

  def create
    @student = Student.find(params[:student_id])
    @attendance_record = @student.attendance_records.build(create_update_params)
    if @attendance_record.save
      flash[:notice] = "Attendance record created"
      redirect_to student_path(@student) and return
    else
      flash[:alert] = "Failed to create attendance record"
      render :new, status: :unprocessable_entity
    end
  end

  private
  def create_update_params
    params.require(:attendance_record).permit(:date, :status, :reason, :description)
  end
end
