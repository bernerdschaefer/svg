require "spec_helper"

describe SVG::Node::Path do
  it "inherits from SVG::Node" do
    SVG::Node::Path.new.should be_a_kind_of SVG::Node
  end

  its "name" do
    SVG::Node::Path.new.name.should eq "path"
  end
end
