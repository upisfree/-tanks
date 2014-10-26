# Math
Math.randomInt = (min, max) ->
  Math.floor Math.random() * (max - min + 1) + min

Math.radiansToDegrees = (r) ->
  r * (180 / Math.PI)

Math.degreesToRadians = (d) ->
  d = 360 if d is 0
  d * (Math.PI / 180)

# Other
animate = ->
  requestAnimFrame animate
  # wow. emptiness and despair here
  renderer.render stage