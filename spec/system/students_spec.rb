require 'rails_helper'

RSpec.describe "Students", type: :system do
  include Devise::Test::IntegrationHelpers

  before do
    driven_by(:rack_test)
  end

  before :each do
    admin = User.create!(email: 'admin@school.edu', password: 'school123', role: :admin)
    sign_in admin

    Student.create!(first: "A", last: "Xstudent", graduation_year: 2000, homeroom: "123")
    Student.create!(first: "B", last: "Ystudent", graduation_year: 2001, homeroom: "456")
    Student.create!(first: "C", last: "Zstudent", graduation_year: 2002, homeroom: "789")
  end

  context "#index" do
    it "should order students by last name" do
      visit students_path
      expect(page).to have_content(/xstudent.+ystudent.+zstudent/i)
    end

    it "should search by name" do
      visit(students_path(name_search: "Y"))
      expect(page).to have_content /B Ystudent/
      expect(page).not_to have_content /A Xstudent/
      expect(page).not_to have_content /C Zstudent/
    end
  end

  context "#show" do
  end

  context "#new/#create" do
    it "should create a new student successfully (happy path)" do
      # arrange
      visit new_student_path
      fill_in "First", with: "Test"
      fill_in "Last", with: "Student"
      fill_in "Homeroom", with: "Somewhere"
      fill_in "Graduation year", with: "2100"

      # act
      click_on "Create Student"

      # assert
      expect(page).to have_content /Test Student/
      expect(page).to have_current_path students_path
    end

    it "should render new if save fails (sad path)" do
      visit new_student_path
      fill_in "First", with: "Test"
      fill_in "Last", with: "Student"
      fill_in "Homeroom", with: "Somewhere"
      fill_in "Graduation year", with: "2100"

      # arrange
      student = Student.new
      expect(student).to receive(:save) { nil }
      expect(Student).to receive(:new) { student }

      # act
      click_on "Create Student"

      # assert
      expect(page).to have_content /Student couldn't be created/
    end
  end

  context "#edit/#update" do
    it "should successfully edit a student (happy path)" do
      visit students_path
      click_on "B Ystudent"
      click_on "Edit student record"
      fill_in "First", with: "Editname"
      click_on "Update Student"
      expect(page).to have_content /successfully updated/i
      expect(page).to have_content /Editname Ystudent/
    end

    it "should re-render the form if update fails (sad path)" do
      visit students_path
      click_on "B Ystudent"

      click_on "Edit student record"
      fill_in "First", with: "Editname"

      # arrange
      # before updating student, stub find and update appropriately
      s = Student.new
      expect(Student).to receive(:find).and_return(s)
      expect(s).to receive(:update).and_return(nil)

      # act
      click_on "Update Student"

      # assert
      expect(page).to have_content /Student couldn't be updated/
    end
  end

  context "#destroy" do
    it "should successfully destroy a student" do
      visit students_path
      click_on "A Xstudent"

      click_on "Delete student record"

      expect(page).to have_current_path students_path
      expect(page).to have_content /Student .+ deleted/i
    end
  end
end
