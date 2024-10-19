require 'rails_helper'

RSpec.describe Student, type: :model do
  context "#name" do
    it "should put first and last together, capitalized" do
      s = Student.new(first: "abc", last: "def")
      expect(s.name).to eq("Abc Def")
    end
  end
end
