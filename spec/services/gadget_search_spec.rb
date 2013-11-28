require "spec_helper"

describe GadgetSearch do
  describe "searching" do
    let(:user_id) { 1 }

    context "by user" do
      it "calls by_user_id" do
        expect(Gadget).to receive(:by_user_id).with(user_id)
        GadgetSearch.new(user_id).search
      end
    end

    context "by user and gadget name" do
      let (:gadget_name) { "android" }

      it "calls by_user_id and full_text_search" do
        criteria = Gadget.criteria
        expect(Gadget).to receive(:by_user_id).with(user_id) { criteria }
        expect(criteria).to receive(:full_text_search).with(gadget_name)
        GadgetSearch.new(user_id, gadget_name).search
      end
    end
  end
end
