require "../src/lime.cr"

# Load the image:
image_path = "#{__DIR__}/image.png"
image = Pixels.new(image_path, 5, 5)

# Insert the image pixels into the buffer:
image.draw

# Draw the content of the buffer to the screen:
Lime.draw
