require 'rails_helper'

RSpec.describe Student, type: :model do
  context "#name" do
    it "should put first and last together, capitalized" do
      s = Student.new(first: "abc", last: "def")
      expect(s.name).to eq("Abc Def")
    end
  end

  context "#name_search" do
    before(:each) do 
      @a = Student.create!(first: "apple", last: "potatohead")
      @b = Student.create!(first: "kiwi", last: "melonhead")
    end

    it "should correctly find student by name (one match)" do
      expect(Student.name_search('kiwi')).to match_array([@b])
    end

    it "should correctly find student by name (multiple match)" do
      expect(Student.name_search('head')).to match_array([@a, @b])
    end

    it "should correctly find student by name (no match)" do
      expect(Student.name_search('stuff')).to match_array([])
    end
  end
end
