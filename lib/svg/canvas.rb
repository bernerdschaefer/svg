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

    # Adds a new path onto the scope stack.
    #
    # @return [SVG::Node::Path] the new path node
    def begin_path
      SVG::Node::Path.new.tap do |path|
        scope << path
      end
    end

    # Removes the current path from the end of the stack, and appends the path
    # node to the previous scope.
    def end_path
      scope.pop.tap do |path|
        current_scope << path
      end
    end

    # @return [SVG::Node] the current scope, or the root
    def current_scope
      scope.last || root
    end

    # @return [Array] a stack of nodes on the canvas
    def scope
      @scope ||= []
    end

    # @return [XML::Node] the root node for this canvas
    def root
      @root ||= SVG::Node.new("svg").tap do |root|
        root["version"] = "1.1"
        root["xmlns"] = "http://www.w3.org/2000/svg"
      end
    end

    # Delegates missing method calls to the current scope.
    def method_missing(method, *args)
      if current_scope.respond_to? method
        current_scope.send method, *args
      else
        super
      end
    end

  end
end
