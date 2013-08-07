require 'spec_helper'

describe User do
	before { @user = User.new(name: "saltydude48", email: "saltydude@gmail.com", password: "pokemon1", password_confirmation: "pokemon1")}

	subject { @user }

	it { should respond_to(:name)}
	it { should respond_to(:email)}
	it { should respond_to(:password)}
	it { should respond_to(:password_confirmation)}

	it { should be_valid }

	describe "when email is not present" do
		before { @user.email = " "}
		it { should_not be_valid }
	end

	describe "when name is not present" do
		before { @user.name = " "}
		it { should_not be_valid }
	end

	describe "when email format is invalid" do
	 	it "should be invalid" do
	 		addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
	 		addresses.each do |invalid_address|
	 			@user.email = invalid_address
	 			@user.should_not be_valid
	 		end
	 	end
	end

	describe "when email format is valid" do
	 	it "should be valid" do
	 		addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
	 		addresses.each do |valid_address|
	 			@user.email = valid_address
	 			@user.should be_valid
	 		end
	 	end
	end

	describe "when email address is already taken" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save
		end
		it { should_not be_valid }
	end

	describe "when name is already taken" do
		before do
			user_with_same_name = @user.dup
			user_with_same_name.name = @user.name.upcase
			user_with_same_name.save
		end
		it { should_not be_valid }
	end

	describe "when password format is invalid" do
		it "should be invalid" do
			password = %w[123456 abcdef abc5]
			password.each do |invalid_password|
				@user.password = invalid_password
				@user.password_confirmation = invalid_password
				@user.should_not be_valid
			end
		end
	end

	describe "when password format is valid" do
		it "should be valid" do
			password = %w[pokemon4 12345678a LOLERSKATEZ1 ChrisTeeMoney1]
			password.each do|valid_password|
				@user.password = valid_password
				@user.password_confirmation = valid_password
				@user.should be_valid
			end
		end
	end		

	describe "when password doesn't match confirmation" do
	end

end
