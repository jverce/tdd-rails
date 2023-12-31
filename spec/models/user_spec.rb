require "rails_helper"

RSpec.describe User, type: :model do
  let(:email) { "foo@example.com" }

  describe "creation" do
    it "cannot be created without an email address" do
      # Act/Assert
      expect {
        User.create!
      }.to raise_error(ActiveRecord::RecordInvalid, /Email can't be blank/i)
    end

    it "should not grant a user root status by default" do
      # Arrange/Act
      user = User.create!(email: email)

      # Assert
      expect(user.root?).to be(false)
    end

    it "should grant a user root status explicitly" do
      # Arrange/Act
      user = User.create!(email: email, root: true)

      # Assert
      expect(user.root?).to be(true)
    end

    it "should not allow duplicate email addresses" do
      # Arrange
      User.create!(email: email)

      # Act/Assert
      expect {
        User.create!(email: email)
      }.to raise_error(ActiveRecord::RecordInvalid, /Email has already been taken/i)
    end
  end

  describe "details" do
    let(:user) { User.create!(email: email) }

    it "should tell me the user's email domain" do
      # Arrange
      email_domain = "example.com"
      user = User.create!(email: "foo@#{email_domain}")

      # Act/Assert
      expect(user.email_domain).to eq(email_domain)
    end
  end
end
