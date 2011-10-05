require "spec_helper"

describe SVG::Transform do

  let(:transform) { SVG::Transform.new }

  describe "#to_s" do
    context "when no scale or translation is set" do
      it "is blank" do
        transform.to_s.should eq ""
      end
    end

    context "with scale set" do
      before do
        transform.scale 1, 2
      end

      it "returns the scale" do
        transform.to_s.should eq "scale(1, 2)"
      end
    end

    context "with translate set" do
      before do
        transform.translate 1, 2
      end

      it "returns the translate" do
        transform.to_s.should eq "translate(1, 2)"
      end
    end

    context "with translate and scale set" do
      before do
        transform.scale 1, -1
        transform.translate 100.0, -40
      end

      it "returns the translate and scale" do
        transform.to_s.should eq "scale(1, -1) translate(100.0, -40)"
      end
    end
  end

  describe "#scale" do
    context "with only xscale" do
      it "sets the scale factors" do
        transform.scale 1
        transform.transform[:scale].should eq [1, 1]
      end
    end

    context "with xscale and yscale" do
      it "sets the scale factors" do
        transform.scale 1, -1
        transform.transform[:scale].should eq [1, -1]
      end
    end
  end

  describe "#translate" do
    context "with only x" do
      it "sets the translate positions" do
        transform.translate 100.0
        transform.transform[:translate].should eq [100.0, 0]
      end
    end

    context "with xtranslate and ytranslate" do
      it "sets the translate position" do
        transform.translate 1, -1
        transform.transform[:translate].should eq [1, -1]
      end
    end
  end

end
