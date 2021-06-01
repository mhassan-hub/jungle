require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = User.create(first_name: "Austin", last_name: "Powers", email: "a@a.com", password: "pass", password_confirmation: "pass")
  end
  describe 'Validations' do
    it "is valid when name, email, password and password confirmation exist" do
      @user.save
      expect(@user).to be_valid
    end
    it "is valid when password and password confirmation match" do
      @user.password_confirmation = "passNot"
      @user.save
      expect(@user).to_not be_valid
    end
    it "is not valid when password is nil" do
      @user.password = nil
      @user.save
      expect(@user).to_not be_valid
    end

    it "is not valid when email is not unique" do
      @user2 = User.create(first_name: "Austin", last_name: "Powers", email: "a@a.com", password: "pass", password_confirmation: "pass")
      @user.save
      @user2.save
      expect(@user2).to_not be_valid
    end

    it "is not valid when password is too short" do
      @user.password = "pa"
      @user.save
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end
end
