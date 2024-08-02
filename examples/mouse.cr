require "../src/lime.cr"

# This will be used to detect if there was a collision between the mouse
# and the target's hitbox
def collision?(event, hitbox)
  event_size = 1
  event.x < hitbox.x + hitbox.width &&
    event.x + event_size > hitbox.x &&
    event.y < hitbox.y + hitbox.height &&
    event.y + event_size > hitbox.y
end

record Hitbox, x : Int32, y : Int32 do
  getter height = 2, width = 3
  setter x, y
end

# A random position for the target and its hitbox
x, y = rand(1..20), rand(10)
target = Rectangle.new(x, y, 3, 2, color: :white)
hitbox = Hitbox.new(x, y)

# Set the mouse mode to Click which will report all clicks:
Mouse.mode = Mouse::Mode::Click

puts "Press any mouse button to start."

loop do
  # Wait for an event:
  event = Mouse.get

  # Exit if the event is not a mouse event:
  abort("Event was not a mouse event.", 0) if event.nil?

  # Place the target at a new random position if the target has been hit:
  if collision?(event, hitbox)
    x, y = rand(1..50), rand(25)

    target.x = x
    target.y = y

    hitbox.x = x
    hitbox.y = y
  end

  # Insert the target into the buffer:
  target.draw

  # Draw the content of the buffer to the screen:
  Lime.draw
  # Clear the buffer so we have room for new stuff:
  Lime.clear

  # You can use `Lime.loop` instead of a normal loop to skip the above two steps
end
