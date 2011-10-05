module SVG
  class Canvas

    # @return [XML::Document] the raw XML document for this canvas
    def raw
      @raw ||= XML::Document.new
    end

  end
end
