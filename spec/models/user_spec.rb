require 'rails_helper'

RSpec.describe User, type: :model do
  context "roles" do
    it "should have admin, attendant, and parent roles" do
      expect(User.new).to respond_to(:admin?)
      expect(User.new).to respond_to(:attendant?)
      expect(User.new).to respond_to(:parent?)
    end
  end
end
