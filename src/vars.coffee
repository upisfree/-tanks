# Screen vars
step = 32
size =
  x: ((window.innerWidth  - 94) / step).toFixed() # canvas.top * 2 + canvas.border.width * 2 = 94
  y: ((window.innerHeight - 94) / step).toFixed()

screen =
  x: size.x * step
  y: size.y * step

stage = new PIXI.Stage 0x3f2700
container = new PIXI.DisplayObjectContainer() # new PIXI.SpriteBatch()
renderer = new PIXI.autoDetectRenderer screen.x, screen.y

document.body.appendChild renderer.view

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