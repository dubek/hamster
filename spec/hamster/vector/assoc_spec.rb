require "spec_helper"
require "hamster/vector"

describe Hamster::Vector do
  before do
    @vector = Hamster.vector([:a, 3], [:b, 2], [:c, 1])
  end

  describe "#assoc" do
    it "searches for a key/val pair with a given key" do
      @vector.assoc(:b).should == [:b, 2]
    end

    it "returns nil if a matching key is not found" do
      @vector.assoc(:d).should be_nil
    end

    it "uses #== to compare keys with provided object" do
      @vector.assoc(EqualNotEql.new).should_not be_nil
    end
  end

  describe "#rassoc" do
    it "searches for a key/val pair with a given value" do
      @vector.rassoc(1).should == [:c, 1]
    end

    it "returns nil if a matching value is not found" do
      @vector.rassoc(4).should be_nil
    end

    it "uses #== to compare values with provided object" do
      @vector.rassoc(EqualNotEql.new).should_not be_nil
    end
  end
end