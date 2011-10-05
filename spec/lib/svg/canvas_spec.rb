require "spec_helper"

describe SVG::Canvas do

  let(:canvas) { SVG::Canvas.new }

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

end
