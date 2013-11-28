require "spec_helper"
require "carrierwave/test/matchers"

describe ImageUploader do
  include CarrierWave::Test::Matchers
  include ActionDispatch::TestProcess

  let(:file_path) { "spec/support/fixtures/sorocaba.jpg" }
  let(:file) { fixture_file_upload(file_path) }
  let(:photo) { build(:photo) }
  let(:uploader) { ImageUploader.new(photo, file) }

  before do
    uploader.store!(File.open("#{Rails.root}/#{file_path}"))
  end

  after do
    uploader.remove!
  end

  it "keeps the original image size" do
    expect(uploader).to have_dimensions(800, 600)
  end

  it "generates thumb" do
    expect(uploader.thumb).to have_dimensions(400, 300)
  end

end
