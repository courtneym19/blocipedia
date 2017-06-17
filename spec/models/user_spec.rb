require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  before :each do
    sign_in user
  end

  should have_many(:assignments)
  should have_many(:roles).through(:assignments)

  describe "attributes" do
     it "responds to role" do
       expect(user).to respond_to(:role)
     end

     it "responds to admin?" do
       expect(user).to respond_to(:admin?)
     end

     it "responds to standard?" do
       expect(user).to respond_to(:standard?)
     end
   end

   describe "roles" do
     it "is standard by default" do
       expect(user.role).to eq("standard")
     end

     context "standard user" do
       it "returns true for #standard?" do
         expect(user.standard?).to be_truthy
       end

       it "returns false for #admin?" do
         expect(user.admin?).to be_falsey
       end
     end

     context "admin user" do
       before do
         user.admin!
       end

       it "returns false for #standard?" do
         expect(user.standard?).to be_falsey
       end

       it "returns true for #admin?" do
         expect(user.admin?).to be_truthy
       end
     end


   end
end
