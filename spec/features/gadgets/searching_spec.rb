require "spec_helper"
include Warden::Test::Helpers
Warden.test_mode!

feature "searching gadget" do
  let!(:user) { create(:user) }
  let(:searched_gadget) { "android" }
  let(:other_gadget) { "iphone" }

  before do
    create(:gadget, name: searched_gadget, user: user)
    create(:gadget, name: other_gadget, user: user)

    login_as(user, :scope => :user)
    visit gadgets_path
    fill_in :q, with: searched_gadget
    click_button "Search"
  end

  context "searches by gadget name" do
    scenario "shows searched gadget" do
      expect(page).to have_content(searched_gadget)
    end

    scenario "does not show other gadgets" do
      expect(page).to_not have_content(other_gadget)
    end
  end
end
