# Screen vars
Screen =
  step: 32
Screen.sizeByStep =
  x: Math.round window.innerWidth / Screen.step
  y: Math.round window.innerHeight / Screen.step
Screen.size =
  x: Screen.sizeByStep.x * Screen.step
  y: Screen.sizeByStep.y * Screen.step

# Mouse
Mouse =
  position:
    x: 0
    y: 0

# Engine
Engine = Matter.Engine.create document.body,
  world:
    gravity:
      x: 0
      y: 0
    bounds:
      min:
        x: -Infinity
        y: -Infinity
      max:
        x: Infinity
        y: Infinity
  enableSleeping: true
  render:
    controller: Matter.RenderPixi
    options:
      width: Screen.size.x
      height: Screen.size.y
      wireframes: false
  map: []

# Game objects
Entities =
  tanks: {}
  #hedgehogs: []
  #bots: []
  #players: []