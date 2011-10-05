module SVG
  class Canvas

    # Scales the canvas based on the provided x and y scale factors.
    #
    # See: http://www.w3.org/TR/SVG/coords.html#TransformAttribute
    #
    # @param xscale the x-axis scale factor
    # @param yscale the y-axis scale factor
    def scale(xscale, yscale = xscale)
      root["transform"] = "scale(#{xscale}, #{yscale})"
    end

    # Translates the document based on the provided x and y positions.
    #
    # See: http://www.w3.org/TR/SVG/coords.html#TransformAttribute
    #
    # @param xscale the x position
    # @param yscale the y position
    def translate(x, y = 0)
      root["transform"] = "translate(#{x}, #{y})"
    end

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
      @root ||= XML::Node.new("svg").tap do |root|
        root["version"] = "1.1"
        root["xmlns"] = "http://www.w3.org/2000/svg"
      end
    end

  end
end
