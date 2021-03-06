require "spec_helper"

describe SVG::NodeHelpers do
  let(:canvas) { SVG::Node.new "svg" }

  describe "#clip_path" do
    context "with no arguments" do
      let!(:clip_path) { canvas.clip_path }

      it "returns a new clip_path node" do
        clip_path.should be_an_instance_of SVG::Node
      end

      it "adds the node to self" do
        canvas.children.should include clip_path
      end
    end

    context "with a properties hash" do
      let(:clip_path) { canvas.clip_path clipPathUnits: "userSpaceOnUse" }

      it "returns a new clip_path node" do
        clip_path.should be_an_instance_of SVG::Node
      end

      it "sets the properties on the clip_path node" do
        clip_path[:clipPathUnits].should eq "userSpaceOnUse"
      end
    end

    context "with a properties hash" do
      let(:clip_path) do
        canvas.clip_path do |clip_path|
          clip_path["clipPathUnits"] = "userSpaceOnUse"
        end
      end

      it "returns a new clip_path node" do
        clip_path.should be_an_instance_of SVG::Node
      end

      it "yields the clip_path node" do
        clip_path[:clipPathUnits].should eq "userSpaceOnUse"
      end
    end
  end

  describe "#g" do
    context "with no arguments" do
      it "returns a new graphics node" do
        canvas.g.should be_an_instance_of SVG::Node
      end

      it "adds the node to self" do
        g = canvas.g
        canvas.children.should include g
      end
    end

    context "with a properties hash" do
      let(:g) { canvas.g width: 100 }

      it "returns a new graphics node" do
        g.should be_an_instance_of SVG::Node
      end

      it "sets the properties on the graphics node" do
        g[:width].should eq "100"
      end
    end

    context "with a properties hash" do
      let(:g) do
        canvas.g do |g|
          g[:width] = 100
        end
      end

      it "returns a new graphics node" do
        g.should be_an_instance_of SVG::Node
      end

      it "yields the graphics node" do
        g[:width].should eq "100"
      end
    end
  end

  describe "#path" do
    context "with no arguments" do
      let!(:path) { canvas.path }

      it "returns a new path node" do
        path.should be_an_instance_of SVG::Node::Path
      end

      it "adds the node to self" do
        canvas.children.should include path
      end
    end

    context "with a properties hash" do
      let(:path) { canvas.path fill: "none" }

      it "returns a new path node" do
        path.should be_an_instance_of SVG::Node::Path
      end

      it "sets the properties on the path node" do
        path[:fill].should eq "none"
      end
    end

    context "with a properties hash" do
      let(:path) do
        canvas.path do |path|
          path["fill"] = "none"
        end
      end

      it "returns a new path node" do
        path.should be_an_instance_of SVG::Node::Path
      end

      it "yields the path node" do
        path[:fill].should eq "none"
      end
    end
  end

  describe "#rect" do
    context "with no arguments" do
      let!(:rect) { canvas.rect }

      it "returns a new rect node" do
        rect.should be_an_instance_of SVG::Node
      end

      it "adds the node to self" do
        canvas.children.should include rect
      end
    end

    context "with a properties hash" do
      let(:rect) { canvas.rect fill: "none" }

      it "returns a new rect node" do
        rect.should be_an_instance_of SVG::Node
      end

      it "sets the properties on the rect node" do
        rect[:fill].should eq "none"
      end
    end

    context "with a properties hash" do
      let(:rect) do
        canvas.rect do |rect|
          rect["fill"] = "none"
        end
      end

      it "returns a new rect node" do
        rect.should be_an_instance_of SVG::Node
      end

      it "yields the rect node" do
        rect[:fill].should eq "none"
      end
    end
  end
end
