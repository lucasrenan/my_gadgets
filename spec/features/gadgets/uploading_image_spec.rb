require "spec_helper"
include Warden::Test::Helpers
Warden.test_mode!

feature "uploading gadget image" do
  let!(:user) { create(:user) }
  let!(:gadget) { build(:gadget) }
  let(:file_path) { "spec/support/fixtures/sorocaba.jpg" }

  before do
    login_as(user, :scope => :user)
  end

  scenario "creates gadget image successfully" do
    pending
    visit new_gadget_path
    fill_in :gadget_name, with: gadget.name
    click_link "add image"
    attach_file ".image", "#{Rails.root}/#{file_path}"

    expect(page).to have_content("remove")
  end

end
