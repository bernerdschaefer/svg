module SVG
  class Node
    class Path < Node

      def initialize
        super "path"
      end

      # Closes the current subpath by drawing a straight line from the current
      # point to current subpath's initial point. Equivalent to "Z".
      def close_path
        append_path_data "Z"
      end

      # Draws a line from the current point to the given relative (x,y)
      # coordinate which becomes the new current point. Equivalent to "L".
      #
      # @param x the x coordinate to move to
      # @param y the y coordinate to move to
      def line_to(x, y)
        append_path_data "l #{x} #{y}"
      end

      # Draws a line from the current point to the given absolute (x,y)
      # coordinate which becomes the new current point. Equivalent to "L".
      #
      # @param x the x coordinate to draw to
      # @param y the y coordinate to draw to
      def line_to!(x, y)
        append_path_data "L #{x} #{y}"
      end

      # Starts a new sub-path at the given relative (x,y) coordinate.
      # Equivalent to "M".
      #
      # @param x the x coordinate to move to
      # @param y the y coordinate to move to
      def move_to(x, y)
        append_path_data "m #{x} #{y}"
      end

      # Starts a new sub-path at the given absolute (x,y) coordinate.
      # Equivalent to "M".
      #
      # @param x the x coordinate to move to
      # @param y the y coordinate to move to
      def move_to!(x, y)
        append_path_data "M #{x} #{y}"
      end

      private

      def append_path_data(data)
        self["d"] = [self["d"], data].join(" ").strip
      end

    end
  end
end
