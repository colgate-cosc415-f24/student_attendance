require 'rails_helper'

RSpec.describe "Students", type: :system do
  before do
    driven_by(:rack_test)
  end

  before :each do
    Student.create!(first: "A", last: "Xstudent", graduation_year: 2000, homeroom: "123")
    Student.create!(first: "B", last: "Ystudent", graduation_year: 2001, homeroom: "456")
    Student.create!(first: "C", last: "Zstudent", graduation_year: 2002, homeroom: "789")
  end

  context "#index" do
    it "should order students by last name" do
      visit students_path
      expect(page).to have_content(/xstudent.+ystudent.+zstudent/i)
    end
  end

  context "#show" do
  end

  context "#new/#create" do
  end

  context "#edit/#update" do
  end

  context "#destroy" do
  end
end
