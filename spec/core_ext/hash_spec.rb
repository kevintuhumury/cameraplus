require 'spec_helper'

describe Hash do

  context "accessing it's keys as methods" do

    let(:hash) do
      { :foo => "bar", "baz" => "qux", :quux => "", "corge" => "", :grault => nil, "garply" => nil }
    end

    context "with the key being a symbol" do

      it "should have a value" do
        hash.foo.should eq "bar"
      end

      it "should be empty" do
        hash.quux.should be_empty
      end

      it "should be nil" do
        hash.grault.should be_nil
      end

    end

    context "with the key being a string" do

      it "should have a value" do
        hash.baz.should eq "qux"
      end

      it "should be empty" do
        hash.corge.should be_empty
      end

      it "should be nil" do
        hash.garply.should be_nil
      end

    end

    context "when the key isn't defined" do

      it "should raise a NoMethodError exception" do
        expect { hash.some_method }.to raise_error NoMethodError
      end

    end

  end

end
