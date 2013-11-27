require "spec_helper"
include Warden::Test::Helpers
Warden.test_mode!

feature "updating gadget" do
  let!(:user) { create(:user) }
  let!(:gadget) { create(:gadget, user: user) }

  before do
    login_as(user, :scope => :user)
  end

  context "with valid data" do
    let(:new_name) { "new gagdget name" }

    scenario "updates gadget successfully" do
      visit edit_gadget_path(gadget)
      fill_in :gadget_name, with: new_name
      click_button "Update Gadget"
      expect(page).to have_content(new_name)
    end
  end

  context "with invalid data" do
    scenario "does not update gadget" do
      visit edit_gadget_path(gadget)
      fill_in :gadget_name, with: ""
      click_button "Update Gadget"
      expect(page).to have_content(gadget.name)
    end
  end

end
