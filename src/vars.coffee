# Screen vars
screenSize = 640
step = 32
size = screenSize / step

stage = new PIXI.Stage 0x3f2700
renderer = new PIXI.autoDetectRenderer screenSize, screenSize

document.body.appendChild renderer.view

# Game objects
entities =
  hedgehogs: []
  bots: []
  shells: []

# Other
shellSpeed = 2

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