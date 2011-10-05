require "spec_helper"

describe SVG::Node do

  let(:node) { SVG::Node.new "svg" }

  describe "#current_transformation" do
    it "returns a SVG::Transform object" do
      node.current_transformation.should be_an_instance_of(SVG::Transform)
    end
  end

  describe "#scale" do
    context "with only xscale" do
      it "sets the SVG element's transform to scale" do
        node.scale 1
        node["transform"].should eq "scale(1, 1)"
      end
    end

    context "with xscale and yscale" do
      it "sets the SVG element's transform to scale" do
        node.scale 1, -1
        node["transform"].should eq "scale(1, -1)"
      end
    end
  end

  describe "#translate" do
    context "with only x position" do
      it "sets the SVG element's transform to translate" do
        node.translate 100
        node["transform"].should eq "translate(100, 0)"
      end
    end

    context "with x and y positions" do
      it "sets the SVG element's transform to translate" do
        node.translate 100, -4
        node["transform"].should eq "translate(100, -4)"
      end
    end
  end

end
