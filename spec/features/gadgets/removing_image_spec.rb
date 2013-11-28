require "spec_helper"
include Warden::Test::Helpers
Warden.test_mode!

feature "removing gadget image" do
  let!(:user) { create(:user) }
  let(:file_path) { "spec/support/fixtures/sorocaba.jpg" }
  let(:photo) { Photo.new(image: File.open("#{Rails.root}/#{file_path}")) }
  let!(:gadget) { create(:gadget, user: user, photos: [photo]) }

  before do
    login_as(user, :scope => :user)
  end

  scenario "removes gadget image successfully" do
    pending
    photo_url = gadget.photos.first.image.thumb.url
    visit edit_gadget_path(gadget)
    click_link "remove"
    click_button "Update Gadget"
    expect(page).not_to have_xpath("//img[@src=\"#{photo_url}\"]")
  end

end
