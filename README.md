# SVG

This is a library for building SVG images in ruby, using `libxml-ruby`.

## Examples

### Drawing a square

    # examples/square/square.rb
    canvas = SVG::Canvas.new 100, 100
    canvas.rect x: 10, y: 10, width: 80, height: 80 do |square|
      square["fill"] = "#ccc"
    end
    canvas.save "square.svg"

<svg version="1.1" xmlns="http://www.w3.org/2000/svg" width="100" height="100">
  <rect x="10" y="10" width="80" height="80" fill="#ccc"/>
</svg>

### Drawing a star

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
    canvas.save "star.svg"

<svg version="1.1" xmlns="http://www.w3.org/2000/svg" width="12cm" height="4cm" viewBox="0 0 1200 400">
  <g fill="red">
  <path d="M 250 75 L 323 301 L 131 161 L 369 161 L 177 301 Z"/>
  </g>
</svg>
