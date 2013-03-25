require 'spec_helper'

describe PrimeNumberGenerator do
  its(:class) do
    should eq PrimeNumberGenerator
  end
  describe "check simple numbers" do
    context "1" do
      it "should not be prime" do
        subject.is_prime?(1).should be_false
      end
    end
    context "2" do
      it "should be prime" do
        subject.is_prime?(2).should be_true
      end
    end
    context "3" do
      it "should be prime" do
        subject.is_prime?(3).should be_true
      end
    end
    context "4" do
      it "should be prime" do
        subject.is_prime?(4).should be_false
      end
    end
  end
  describe "generator" do
    it "should generate primes in range from 7900 to 7920" do
      subject.generate(7900, 7920).should eq [7901, 7907, 7919]
    end
    it "should generate primes in inverse range from 7900 to 7920" do
      subject.generate(7920, 7900).should eq [7919, 7907, 7901]
    end
    it "should generate prime in inverse range from 7901 to 7901" do
      subject.generate(7901, 7901).should eq [7901]
    end
  end
  describe "valid_natural?" do
    it "should not pass 1" do
      subject.send(:valid_natural?, 1).should be_false
    end
    it "should pass 2" do
      subject.send(:valid_natural?, 2).should be_true
    end
    it "should pass 3" do
      subject.send(:valid_natural?, 3).should be_true
    end
    it "should not pass 4" do
      subject.send(:valid_natural?, 4).should be_false
    end
    it "should not pass 2.4" do
      subject.send(:valid_natural?, 2.4).should be_false
    end
    it "should not pass 'string'" do
      subject.send(:valid_natural?, 'string').should be_false
    end
    it "should not pass :symbol" do
      subject.send(:valid_natural?, :symbol).should be_false
    end
  end
end