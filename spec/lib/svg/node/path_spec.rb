require "spec_helper"

describe SVG::Node::Path do
  let(:path) { SVG::Node::Path.new }

  it "inherits from SVG::Node" do
    path.should be_a_kind_of SVG::Node
  end

  its "name" do
    path.name.should eq "path"
  end

  describe "#close_path" do
    it "appends the path data" do
      path.should_receive(:append_path_data).with("Z")
      path.close_path
    end
  end

  describe "#line_to" do
    it "appends the path data" do
      path.should_receive(:append_path_data).with("l 10 10")
      path.line_to 10, 10
    end
  end

  describe "#line_to!" do
    it "appends the path data" do
      path.should_receive(:append_path_data).with("L 10 10")
      path.line_to! 10, 10
    end
  end

  describe "#move_to" do
    it "appends the path data" do
      path.should_receive(:append_path_data).with("m 10 10")
      path.move_to 10, 10
    end
  end

  describe "#move_to!" do
    it "appends the path data" do
      path.should_receive(:append_path_data).with("M 10 10")
      path.move_to! 10, 10
    end
  end

  context "after a sequence of commands" do
    before do
      path.move_to 10, 10
      path.line_to 10, 100
      path.line_to 100, 100
      path.close_path
    end

    its "d" do
      path["d"].should eq "m 10 10 l 10 100 l 100 100 Z"
    end
  end

end
