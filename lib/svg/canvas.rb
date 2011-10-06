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

    def [](attribute)
      root[attribute]
    end

    def []=(attribute, value)
      root[attribute] = value
    end

  end
end
