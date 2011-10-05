module SVG
  class Transform

    # Sets the x- and y-axis scaling factors.
    #
    # See: http://www.w3.org/TR/SVG/coords.html#TransformAttribute
    #
    # @param xscale the x-axis scale factor
    # @param yscale the y-axis scale factor
    def scale(xscale, yscale = xscale)
      transform[:scale] = [xscale, yscale]
    end

    # Sets the x- and y-axis translation positions.
    #
    # See: http://www.w3.org/TR/SVG/coords.html#TransformAttribute
    #
    # @param x the x position
    # @param y the y position
    def translate(x, y = 0)
      transform[:translate] = [x, y]
    end

    # @return [String] the transform as an SVG formatted transformation string
    def to_s
      transform.map do |key, values|
        "%s(%s)" % [key, values.join(", ")]
      end.join " "
    end

    # @return [Hash] the internally tracked transformation properties
    def transform
      @transform ||= {}
    end

  end
end
