require "spec_helper"
include Warden::Test::Helpers
Warden.test_mode!

feature "listing gadget" do
  let!(:user) { create(:user) }
  let!(:gadget) { create(:gadget, user: user) }

  before do
    login_as(user, :scope => :user)
  end

  scenario "lists user gadgets" do
    visit gadgets_path
    expect(page).to have_content(gadget.name)
  end

end
