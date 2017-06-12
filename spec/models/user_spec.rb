require 'rails_helper'

RSpec.describe User, type: :model do

  describe "after_create" do
 # #22
     before do
       @another_comment = Comment.new(body: 'Comment Body', post: post, user: user)
     end

 # #23
     it "sends an email to users who have just signed up for an account" do
       expect(UserMailer).to receive(:new_user).with(user).and_return(double(deliver_now: true))

     end

 # #24
     it "does not send emails to non-members" do
       expect(UserMailer).not_to receive(:new_comment)
 
     end
   end
end
