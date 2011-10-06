$:.unshift "lib"
require "svg"

# Adapted from http://www.w3.org/TR/SVG/images/painting/fillrule-nonzero.svg
canvas = SVG::Canvas.new "12cm", "4cm"
canvas[:viewBox] = "0 0 1200 400"

canvas.g do |g|
  g["fill"] = "red"
  g.path do |path|
    path.move_to! 250, 75
    path.line_to! 323, 301
    path.line_to! 131, 161
    path.line_to! 369, 161
    path.line_to! 177, 301
    path.close_path
  end
end
puts canvas
