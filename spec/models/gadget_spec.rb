require 'spec_helper'

describe Gadget do
  let(:user) { build(:user) }
  subject { build(:gadget, user: user) }

  it { should be_valid }
  it { should belong_to(:user) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user) }
end
