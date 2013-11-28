require 'spec_helper'

describe Gadget do
  let(:user) { build(:user) }
  subject { build(:gadget, user: user) }

  it { should be_valid }
  it { should belong_to(:user) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user) }

  describe "#by_user_id" do
    let(:user_id) { 1 }

    it "returns criteria with where user_id" do
      scope = Gadget.by_user_id(user_id)
      expect(scope.selector).to eq({"user_id"=>user_id})
    end
  end

  describe "searching" do
    let(:gadget_name) { "android" }
    let(:user) { build(:user) }

    before do
      create(:gadget, name: gadget_name, user: user)
      create(:gadget, name: "iphone", user: user)
    end

    it "searches by name" do
      expect(Gadget.full_text_search(gadget_name).size).to eq(1)
    end
  end
end
