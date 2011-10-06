require "spec_helper"

describe SVG::Node do

  let(:node) { SVG::Node.new "svg" }

  describe "initialize" do
    context "with only a name" do
      it "returns a node with that name" do
        SVG::Node.new("svg").name.should eq "svg"
      end
    end

    context "with a name and properties hash" do
      let(:node) do
        SVG::Node.new("svg", width: 100)
      end

      it "returns a node with that name" do
        node.name.should eq "svg"
      end

      it "sets the properties provided" do
        node["width"].should eq "100"
      end
    end

    context "with a block provided" do
      let(:node) do
        SVG::Node.new "svg" do |node|
          node["width"] = 100
        end
      end

      it "yields the node to the block" do
        node["width"].should eq "100"
      end
    end
  end

  describe "[]" do
    context "with string key" do
      it "returns the attribute value" do
        node["fill"] = "#FF0000"
        node["fill"].should eq "#FF0000"
      end
    end

    context "with symbol key" do
      it "returns the attribute value" do
        node["fill"] = "#FF0000"
        node[:fill].should eq "#FF0000"
      end
    end
  end

  describe "[]=" do
    context "with string key" do
      it "sets the attribute value" do
        node["fill"] = "#FF0000"
        node["fill"].should eq "#FF0000"
      end
    end

    context "with symbol key" do
      it "sets the attribute value" do
        node[:fill] = "#FF0000"
        node[:fill].should eq "#FF0000"
      end
    end

    context "with a string value" do
      it "sets the attribute value" do
        node[:fill] = "#FF0000"
        node[:fill].should eq "#FF0000"
      end
    end

    context "with a numeric value" do
      it "sets the attribute value" do
        node[:width] = 10
        node[:width].should eq "10"
      end
    end
  end

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
