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

    its "root" do
      canvas.raw.root.name.should eq "svg"
    end

    describe "<svg>" do
      let(:root) { canvas.raw.root }

      its "namespace" do
        root["xmlns"].should eq "http://www.w3.org/2000/svg"
      end

      its "version" do
        root["version"].should eq "1.1"
      end
    end
  end

  describe "#root" do
    it "is an SVG::Node" do
      canvas.root.should be_an_instance_of SVG::Node
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

  describe "#current_scope" do
    context "with no scope" do
      it "returns the root" do
        canvas.current_scope.should eq canvas.root
      end
    end

    context "with a scope" do
      let(:scope) { SVG::Node.new "path" }

      before do
        canvas.scope << scope
      end

      it "returns the current scope" do
        canvas.current_scope.should eq scope
      end
    end
  end

  describe "#scale" do
    let(:scope) { SVG::Node.new "path" }

    it "delegates to the current scope" do
      canvas.stub(:current_scope => scope)
      scope.should_receive(:scale).with(100, 100)
      canvas.scale(100, 100)
    end
  end

  describe "#translate" do
    let(:scope) { SVG::Node.new "path" }

    it "delegates to the current scope" do
      canvas.stub(:current_scope => scope)
      scope.should_receive(:translate).with(100, 100)
      canvas.translate(100, 100)
    end
  end

  describe "#begin_path" do
    it "pushes an SVG::Node::Path onto the stack" do
      canvas.begin_path
      canvas.current_scope.should be_an_instance_of SVG::Node::Path
    end

    it "returns the new path" do
      canvas.begin_path.should eq canvas.current_scope
    end
  end

  describe "#end_path" do
    let!(:path) { canvas.begin_path }

    it "removes the path from the stack" do
      canvas.end_path
      canvas.current_scope.should eq canvas.root
    end

    it "adds the path to the document" do
      canvas.end_path
      canvas.root.children.should include path
    end
  end

end
