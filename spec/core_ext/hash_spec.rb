require 'spec_helper'

describe Hash do

  context "accessing it's keys as methods" do

    let(:hash) do
      { :foo => "bar", "baz" => "qux" }
    end

    it "should get access to the value of a symbol" do
      hash.foo.should eq "bar"
    end

    it "should get access to the value of a string" do
      hash.baz.should eq "qux"
    end

  end

end
