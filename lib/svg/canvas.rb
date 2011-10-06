module SVG
  class Canvas < XML::Document

    # @param width the canvas width
    # @param height the canvas height
    def initialize(width, height)
      super()

      self.root = SVG::Node.new("svg").tap do |svg|
        svg["version"] = "1.1"
        svg["xmlns"] = "http://www.w3.org/2000/svg"
        svg["width"] = width
        svg["height"] = height
      end
    end

    # Creates a new graphics (`g`) node.
    #
    # @param [Hash] properties a hash of properties to set on the graphics node
    # @yield [SVG::Node] the graphics node
    # @return [SVG::Node] the graphics node
    def g(properties = {})
      SVG::Node.new("g", properties) do |g|
        root << g

        yield g if block_given?
      end
    end

    def [](attribute)
      root[attribute]
    end

    def []=(attribute, value)
      root[attribute] = value
    end

  end
end
