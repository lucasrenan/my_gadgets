require 'spec_helper'

describe Photo do
  subject { build(:photo) }

  it { should be_valid }
  it { should be_embedded_in(:gadget) }
end
