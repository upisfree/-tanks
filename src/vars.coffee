# Screen vars
step = 32
size =
  x: (window.innerWidth / step).toFixed()
  y: (window.innerHeight / step).toFixed()

screen =
  x: size.x * step
  y: size.y * step

# Mouse
Mouse =
  position:
    x: 0
    y: 0

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