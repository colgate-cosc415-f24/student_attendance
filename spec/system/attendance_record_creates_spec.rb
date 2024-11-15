require 'rails_helper'

RSpec.describe "AttendanceRecordCreates", type: :system do
  include Devise::Test::IntegrationHelpers

  before do
    driven_by(:rack_test)
  end

  before (:each) do
    @admin = User.create!(email: 'admin@school.edu', password: 'school123', role: :admin)
    @student = Student.create!(first: 'the', last: 'student', graduation_year: 2029, homeroom: 'abcxyz')
  end

  context "admin users only" do
    it "should redirect to students index if not admin or attendant" do
      visit new_student_attendance_record_path(@student)
      expect(page.current_path).to eq(new_user_session_path)
    end
  end

  context "#new/#create" do
    it "should correctly create a new attendance record (happy path)" do
      sign_in @admin
      visit new_student_attendance_record_path(@student)
      select 'Present', from: 'Status'
      fill_in 'Description', with: 'All good'
      click_on 'Create Attendance record'
      expect(page.current_path).to eq(student_path(@student))
      expect(page).to have_content(/attendance record created/i)
    end

    it "should fail to create a new attendance record (sad path)" do
      sign_in @admin
      visit new_student_attendance_record_path(@student)
      ar = AttendanceRecord.new
      expect(ar).to receive(:save) { false }
      expect(AttendanceRecord).to receive(:new) { ar }
      select 'Present', from: 'Status'
      fill_in 'Description', with: 'All good'
      click_on 'Create Attendance record'
      expect(page.current_path).to eq(student_attendance_records_path(@student))
      expect(page).to have_content(/failed to create/i)

    end
  end
end
