# Math
Math.randomInt = (min, max) ->
  Math.floor Math.random() * (max - min + 1) + min

Math.radiansToDegrees = (r) ->
  r * (180 / Math.PI)

Math.degreesToRadians = (d) ->
  d = 360 if d is 0
  d * (Math.PI / 180)

# System methods
Array::remove = (obj) ->
  for key, value of @
    if value.i == obj.i
      @.splice key, 1

# Physics
isCollision = (x1, y1, x2, y2, s1 = step, s2 = step) -> # is this ideal?
  if (x1 + s1 >= x2 and x1 <= x2 + s2) and
     (y1 + s1 >= y2 and y1 <= y2 + s2)
    true
  else
    false