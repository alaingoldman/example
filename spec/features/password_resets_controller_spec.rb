# require 'spec_helper'

# describe PasswordResetsController do
# 	it "emails user when reuqesting password reset" do
# 		user = FactoryGirl.build(:user)
# 		visit log_in_path
# 		click_link "forgotten password?"
# 		current_path.should eq(new_password_reset_path)
# 		page.should have_selector('h1', :text => "Reset Password")
# 	end
# end
