require 'spec_helper'

describe Prime do
  describe "validations" do
    it { should validate_presence_of :first }
    it { should validate_presence_of :last }
    it { should validate_numericality_of(:first).only_integer }
    it { should validate_numericality_of(:last).only_integer }
  end
end