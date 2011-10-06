require "spec_helper"

describe SVG::Canvas do
  let(:canvas) { SVG::Canvas.new(10, 10) }
  let(:root) { canvas.root }

  subject { canvas }

  it { should be_a_kind_of LibXML::XML::Document }

  it "should include NodeHelpers" do
    SVG::Canvas.ancestors.should include SVG::NodeHelpers
  end

  describe "#root" do
    subject { root }

    it { should be_an_instance_of SVG::Node }

    it "should be an svg node" do
      root.name.should eq "svg"
    end

    it "should be version 1.1" do
      root["version"].should eq "1.1"
    end

    it "should have the SVG namespace" do
      root["xmlns"].should eq "http://www.w3.org/2000/svg"
    end

    it "should have the width it was initialized with" do
      root["width"].should eq "10"
    end

    it "should have the height it was initialized with" do
      root["height"].should eq "10"
    end
  end

  describe "#<<" do
    let(:node) { SVG::Node.new "g" }

    it "delegates to the root node" do
      root.should_receive(:<<).with(node)
      canvas << node
    end
  end

  describe "#[]" do
    it "delegates to the root node" do
      root.should_receive(:[]).with("width")
      canvas["width"]
    end
  end

  describe "#[]=" do
    it "delegates to the root node" do
      root.should_receive(:[]=).with("width", 100)
      canvas["width"] = 100
    end
  end

end
