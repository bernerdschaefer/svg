module SVG
  class Canvas

    # @param width the canvas width
    # @param height the canvas height
    def initialize(width, height)
      self.width = width
      self.height = height
    end

    # @return [String] the SVG canvas height
    def height
      root["height"]
    end

    # Sets the SVG canvas height
    #
    # @param height the SVG canvas height
    def height=(height)
      root["height"] = height.to_s
    end

    # @return [String] the SVG canvas width
    def width
      root["width"]
    end

    # @return [String] the canvas as XML
    def to_s
      raw.to_s
    end

    # Sets the SVG canvas width
    #
    # @param width the SVG canvas width
    def width=(width)
      root["width"] = width.to_s
    end

    # @return [XML::Document] the raw XML document for this canvas
    def raw
      @raw ||= XML::Document.new.tap do |document|
        document.root = root
      end
    end

    # @return [XML::Node] the root node for this canvas
    def root
      @root ||= SVG::Node.new("svg").tap do |root|
        root["version"] = "1.1"
        root["xmlns"] = "http://www.w3.org/2000/svg"
      end
    end

    # Delegates missing method calls to the root SVG node.
    def method_missing(method, *args)
      if root.respond_to? method
        root.send method, *args
      else
        super
      end
    end

  end
end
