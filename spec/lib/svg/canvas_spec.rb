require "spec_helper"

describe SVG::Canvas do

  describe "#raw" do
    let(:canvas) { SVG::Canvas.new }

    it "returns the raw libxml document" do
      canvas.raw.should be_an_instance_of LibXML::XML::Document
    end
  end

end
