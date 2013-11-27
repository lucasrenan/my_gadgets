require "spec_helper"
include Warden::Test::Helpers
Warden.test_mode!

feature "creating gadget" do
  let!(:user) { create(:user) }
  let!(:gadget) { build(:gadget) }

  before do
    login_as(user, :scope => :user)
  end

  context "with valid data" do
    scenario "creates gadget successfully" do
      visit new_gadget_path
      fill_in :gadget_name, with: gadget.name
      fill_in :gadget_description, with: gadget.description
      click_button "Create Gadget"
      expect(page).to have_content("Gadget was successfully created.")
    end
  end

  context "with invalid data" do
    scenario "does not create gadget" do
      visit new_gadget_path
      click_button "Create Gadget"
      expect(page).to have_content("Name can't be blank")
    end
  end

end
