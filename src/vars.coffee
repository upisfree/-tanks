# Screen vars
step = 32
size =
  x: ((window.innerWidth  - 94) / step).toFixed() # canvas.top * 2 + canvas.border.width * 2 = 94
  y: ((window.innerHeight - 94) / step).toFixed()

screen =
  x: size.x * step
  y: size.y * step

# Engine
engine = Matter.Engine.create document.body,
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
  render:
    controller: Matter.RenderPixi
    options:
      width: screen.x
      height: screen.y
      wireframes: false
  map: []

# Game objects
entities =
  hedgehogs: []
  bots: []
  players: []
  shells: []

# Block types
BLOCK =
  PLAYER: 'player'
  BOT: 'bot'
  HEDGEHOD: 'hedgehog'
  GROUND: 'ground'
  GRAVEL: 'gravel'
  DIRT: 'dirt'
  GRASS: 'grass'
  PUDDLE: 'puddle'
  SHELL: 'shell'

# Key codes
KEY_CODE =
  CTRL: 17
  ALT: 18
  ESC: 27
  SPACE: 32
  ENTER: 13

  ARROW:
    UP: 38
    LEFT: 37
    DOWN: 40
    RIGHT: 39

  W: 87
  A: 65
  S: 83
  D: 68