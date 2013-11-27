require "spec_helper"
include Warden::Test::Helpers
Warden.test_mode!

feature "removing gadget" do
  let!(:user) { create(:user) }
  let!(:gadget) { create(:gadget, user: user) }

  before do
    login_as(user, :scope => :user)
  end

  scenario "removes gadget successfully" do
    visit gadgets_path
    click_link "remove"
    expect(page).not_to have_content(gadget.name)
  end

end
