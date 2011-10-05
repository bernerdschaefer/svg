module SVG
  class Canvas

    # @return [String, nil] the SVG canvas height or nil
    def height
      root["height"]
    end

    # Sets the SVG canvas height
    #
    # @param height the SVG canvas height
    def height=(height)
      root["height"] = height.to_s
    end

    # @return [String, nil] the SVG canvas width or nil
    def width
      root["width"]
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
      @root ||= XML::Node.new("svg").tap do |root|
        root["version"] = "1.1"
        root["xmlns"] = "http://www.w3.org/2000/svg"
      end
    end

  end
end
