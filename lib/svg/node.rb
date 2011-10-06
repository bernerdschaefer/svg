module SVG

  # Wrapper class around XML::Node, defining the base SVG methods available to
  # all nodes, such as #scale and #transform.
  #
  # @example
  #   SVG::Node.new "svg"
  #
  # @example
  #   SVG::Node.new "svg", width: 100
  #
  # @example
  #   SVG::Node.new "path" do |path|
  #     path.scale 1, -1
  #     path["width"] = 100
  #   end
  #
  class Node < XML::Node

    # Creates a new instance of an SVG node with the given name.
    #
    # @param [String] name the name for this node
    # @param [Hash] properties a hash of properties to set on the node
    # @yield [SVG::Node] the newly created node
    def initialize(name, properties = {})
      super name

      properties.each do |property, value|
        self[property] = value
      end

      yield self if block_given?
    end

    # @return [SVG::Transform] the current transformation object
    def current_transformation
      @current_transformation ||= SVG::Transform.new
    end

    # Sets the value of an attribute, ensuring that both the key and the value
    # have been converted to strings.
    #
    # @param [Symbol, String] attribute the attribute's name
    # @param value the attribute's value - must respond to #to_s
    def []=(attribute, value)
      super attribute.to_s, value.to_s
    end

    # Scales the node based on the provided x and y scale factors.
    #
    # See: http://www.w3.org/TR/SVG/coords.html#TransformAttribute
    #
    # @param xscale the x-axis scale factor
    # @param yscale the y-axis scale factor
    def scale(xscale, yscale = xscale)
      current_transformation.scale(xscale, yscale)
      self["transform"] = current_transformation.to_s
    end

    # Translates the node based on the provided x and y positions.
    #
    # See: http://www.w3.org/TR/SVG/coords.html#TransformAttribute
    #
    # @param x the x position
    # @param y the y position
    def translate(x, y = 0)
      current_transformation.translate(x, y)
      self["transform"] = current_transformation.to_s
    end

  end
end
