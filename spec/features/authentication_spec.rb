require "spec_helper"

feature "authentication" do
  let!(:user) { create(:user, password: "12345678", password_confirmation: "12345678") }

  before do
    visit login_path
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    click_button "Sign in"
  end

  describe "logging" do
    it "logs in with valid credentials" do
      expect(page).to have_content("logout")
    end
  end

  describe "logging out" do
    it "logs out" do
      click_link "logout"
      expect(page).not_to have_content("logout")
    end
  end
end
