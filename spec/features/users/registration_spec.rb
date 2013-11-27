require "spec_helper"

feature "registration" do
  let(:user) { build(:user) }

  before do
    visit sign_up_path
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    fill_in :user_password_confirmation, with: user.password
    click_button "Sign up"
  end

  describe "signing up" do
    scenario "registers in with valid credentials" do
      expect(page).to have_content(user.email)
    end
  end
end
