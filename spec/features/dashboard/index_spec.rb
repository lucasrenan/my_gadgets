require "spec_helper"
include Warden::Test::Helpers
Warden.test_mode!

feature "dashboard" do
  context "when user is signed in" do
    let!(:user) { create(:user) }
    let!(:gadget) { create(:gadget, user: user) }

    before do
      login_as(user, :scope => :user)
    end

    scenario "lists user gadgets" do
      visit root_path
      expect(page).to have_content("my gadgets")
    end
  end

  context "when user is not signed in" do
    scenario "shows login message" do
      visit root_path
      expect(page).to have_content("you should log in to manage gadgets")
    end
  end

end
