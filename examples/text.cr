require "../src/lime.cr"
require "colorize"

Lime.print "red".colorize(:red), 2,2
Lime.print "red on green".colorize(:red).back(:green), 2,3
Lime.print "red bold".colorize(:red).mode(:bold), 2,4
Lime.print "green italic".colorize(:green).mode(:italic), 2,5



# Draw the content of the buffer to the screen:
Lime.draw
