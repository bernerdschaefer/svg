module SVG
  class Canvas < XML::Document

    # @param width the canvas width
    # @param height the canvas height
    def initialize(width, height)
      super()

      self.root = SVG::Node.new "svg",
        version: "1.1",
        xmlns: "http://www.w3.org/2000/svg",
        width: width,
        height: height
    end

    # Creates a new graphics (`g`) node.
    #
    # @param [Hash] properties a hash of properties to set on the graphics node
    # @yield [SVG::Node] the graphics node
    # @return [SVG::Node] the graphics node
    def g(properties = {})
      SVG::Node.new("g", properties) do |g|
        self << g

        yield g if block_given?
      end
    end

    # Adds the provided node to the root node.
    #
    # @param [SVG::Node] node the node to append
    def <<(node)
      root << node
    end

    # @param property the property to return
    # @return [String] the value of the property on the root node
    def [](property)
      root[property]
    end

    # Sets the value of the given property on the root node.
    #
    # @param property the property to set
    # @param value the value to set the property to
    def []=(property, value)
      root[property] = value
    end

  end
end
