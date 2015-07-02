require 'spec_helper'

module Fuel
  describe Author, type: :model do

    subject { build(:author) }

    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to have_many(:posts) }

  end
end
