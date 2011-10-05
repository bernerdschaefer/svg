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

      # Draws a cubic Bézier curve from the current point to (x,y) using
      # (x1,y1) as the control point at the beginning of the curve and (x2,y2)
      # as the control point at the end of the curve. All coordinates are
      # relative.
      #
      # Equivalent to "c".
      #
      # @param x1 the x-axis starting control point
      # @param y1 the y-axis starting control point
      # @param x2 the x-axis ending control point
      # @param y2 the y-axis ending control point
      # @param x  the x-axis starting point
      # @param y  the y-axis starting point
      def curve_to(x1, y1, x2, y2, x, y)
        append_path_data "c", x1, y1, x2, y2, x, y
      end
      alias c curve_to

      # Draws a cubic Bézier curve from the current point to (x,y) using
      # (x1,y1) as the control point at the beginning of the curve and (x2,y2)
      # as the control point at the end of the curve. All coordinates are
      # absolute.
      #
      # Equivalent to "C".
      #
      # @param x1 the x-axis starting control point
      # @param y1 the y-axis starting control point
      # @param x2 the x-axis ending control point
      # @param y2 the y-axis ending control point
      # @param x  the x-axis starting point
      # @param y  the y-axis starting point
      def curve_to!(x1, y1, x2, y2, x, y)
        append_path_data "C", x1, y1, x2, y2, x, y
      end
      alias C curve_to!

      # Draws a line from the current point to the given relative (x,y)
      # coordinate which becomes the new current point. Equivalent to "L".
      #
      # @param x the x coordinate to move to
      # @param y the y coordinate to move to
      def line_to(x, y)
        append_path_data "l", x, y
      end
      alias l line_to

      # Draws a line from the current point to the given absolute (x,y)
      # coordinate which becomes the new current point. Equivalent to "L".
      #
      # @param x the x coordinate to draw to
      # @param y the y coordinate to draw to
      def line_to!(x, y)
        append_path_data "L", x, y
      end
      alias L line_to!

      # Starts a new sub-path at the given relative (x,y) coordinate.
      # Equivalent to "M".
      #
      # @param x the x coordinate to move to
      # @param y the y coordinate to move to
      def move_to(x, y)
        append_path_data "m", x, y
      end
      alias m move_to

      # Starts a new sub-path at the given absolute (x,y) coordinate.
      # Equivalent to "M".
      #
      # @param x the x coordinate to move to
      # @param y the y coordinate to move to
      def move_to!(x, y)
        append_path_data "M", x, y
      end
      alias M move_to!

      # Draws a smooth Bézier curve. See
      # http://www.w3.org/TR/SVG/paths.html#PathDataCubicBezierCommands for
      # details. Equivalent to "s"
      def smooth_curve_to(x2, y2, x, y)
        append_path_data "s", x2, y2, x, y
      end
      alias s smooth_curve_to

      # Draws a smooth Bézier curve. See
      # http://www.w3.org/TR/SVG/paths.html#PathDataCubicBezierCommands for
      # details. Equivalent to "S"
      def smooth_curve_to!(x2, y2, x, y)
        append_path_data "S", x2, y2, x, y
      end
      alias S smooth_curve_to!

      private

      def append_path_data(*data)
        self["d"] = [self["d"], data].join(" ").strip
      end

    end
  end
end
