require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'is valid with all attributes present' do
      @user = User.new(name: "Name", email: "email@email.com", password: "password", password_confirmation: "password")
      expect(@user).to be_valid
    end

    it 'is not valid if password is not present' do
      @user = User.new(name: "Name", email: "email@email.com", password: nil, password_confirmation: "password")
      expect(@user).to_not be_valid
    end

    it 'is not valid if password_confirmation is not present' do
      @user = User.new(name: "Name", email: "email@email.com", password: "password", password_confirmation: nil)
      expect(@user).to_not be_valid
    end

    it 'is not valid if password and password_confirmation do not match' do
      @user = User.new(name: "Name", email: "email@email.com", password: "passwords", password_confirmation: "password")
      expect(@user).to_not be_valid
    end

    it 'is not valid if email is not unique' do
      @user1 = User.new(name: "Name", email: "email@email.com", password: "password", password_confirmation: "password")
      @user1.save!

      @user2 = User.new(name: "Name", email: "Email@eMail.com", password: "password", password_confirmation: "password")
      expect(@user2).to_not be_valid
    end

    it 'is not valid if name is not present' do
      @user = User.new(name: nil, email: "email@email.com", password: "password", password_confirmation: "password")
      expect(@user).to_not be_valid
    end

    it 'is not valid if email is not present' do
      @user = User.new(name: "Name", email: nil, password: "password", password_confirmation: "password")
      expect(@user).to_not be_valid
    end

    it 'is not valid if password is less than 5 characters' do
      @user = User.new(name: "Name", email: "email@email.com", password: "pass", password_confirmation: "pass")
      expect(@user).to_not be_valid
    end 

  end

    describe '.authenticate_with_credentials' do

      it 'authenticates user with correct credentials' do
        @user = User.create(name: "Name", email: "email@email.com", password: "password", password_confirmation: "password")
  
        expect(User.authenticate_with_credentials("email@email.com", "password")).to eq(@user)
      end

      it 'strips out front/back whitespace from email' do
        @user = User.create(name: "Name", email: "email@email.com", password: "password", password_confirmation: "password")

        expect(User.authenticate_with_credentials("   email@email.com   ", "password")).to eq(@user)
      end

      it 'authenticates password with mismatched cases' do
        @user = User.create(name: "Name", email: "email@email.com", password: "password", password_confirmation: "password")

        expect(User.authenticate_with_credentials("EMAIL@EMAIL.COM", "password")).to eq(@user)
      end

    end
    
end
