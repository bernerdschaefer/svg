$:.unshift "lib"
require "svg"

canvas = SVG::Canvas.new 100, 100
canvas.rect x: 10, y: 10, width: 80, height: 80 do |square|
  square["fill"] = "#ccc"
end
puts canvas
