require 'rails_helper'

RSpec.describe StudentHelper, type: :helper do
  context "reason_display" do
    it "should return a string from a hash of reasons" do
      expect(reason_display({one: 1, two: 2})).to eq("one: 1, two: 2")
    end
  end
end
