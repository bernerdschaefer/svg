module SVG
  module NodeHelpers

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

  end
end
