require "spec_helper"

describe SVG::Canvas do

  let(:canvas) { SVG::Canvas.new(10, 10) }

  describe "#initialize" do
    it "sets the canvas width" do
      SVG::Canvas.new(100, 200).width.should eq "100"
    end

    it "sets the canvas height" do
      SVG::Canvas.new(100, 200).height.should eq "200"
    end
  end

  describe "#raw" do
    it "returns the raw libxml document" do
      canvas.raw.should be_an_instance_of LibXML::XML::Document
    end

    its "root element is <svg>" do
      canvas.raw.root.name.should eq "svg"
    end

    describe "<svg>" do
      let(:root) { canvas.raw.root }

      its "namespace is http://www.w3.org/2000/svg" do
        root["xmlns"].should eq "http://www.w3.org/2000/svg"
      end

      its "version is 1.1" do
        root["version"].should eq "1.1"
      end
    end
  end

  describe "#to_s" do
    it "outputs the SVG document" do
      canvas.to_s.should eq canvas.raw.to_s
    end
  end

  describe "#height=" do
    it "sets the SVG element's height" do
      canvas.height = 100.0
      canvas.root["height"].should eq "100.0"
    end
  end

  describe "#height" do
    it "returns the SVG element's height" do
      canvas.height = 300.0
      canvas.height.should eq "300.0"
    end
  end

  describe "#width=" do
    it "sets the SVG element's width" do
      canvas.width = 100.0
      canvas.root["width"].should eq "100.0"
    end
  end

  describe "#width" do
    it "returns the SVG element's width" do
      canvas.width = 300.0
      canvas.width.should eq "300.0"
    end
  end

  describe "#scale" do
    context "with only xscale" do
      it "sets the SVG element's transform to scale" do
        canvas.scale 1
        canvas.root["transform"].should eq "scale(1, 1)"
      end
    end

    context "with xscale and yscale" do
      it "sets the SVG element's transform to scale" do
        canvas.scale 1, -1
        canvas.root["transform"].should eq "scale(1, -1)"
      end
    end
  end

  describe "#translate" do
    context "with only x position" do
      it "sets the SVG element's transform to translate" do
        canvas.translate 100
        canvas.root["transform"].should eq "translate(100, 0)"
      end
    end

    context "with x and y positions" do
      it "sets the SVG element's transform to translate" do
        canvas.translate 100, -4
        canvas.root["transform"].should eq "translate(100, -4)"
      end
    end
  end

end
