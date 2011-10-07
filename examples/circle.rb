$:.unshift "lib"
require "svg"

canvas = SVG::Canvas.new 100, 100
canvas << SVG::Node.new("circle",
  cx: 50,
  cy: 50,
  r: 30,
  fill: 'blue'
)
puts canvas
