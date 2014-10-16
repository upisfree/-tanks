# Screen vars
canvas = document.getElementsByTagName('canvas')[0]
context = canvas.getContext '2d'

screenSize = 640
step = 32
size = screenSize / step

# Game objects
objects =
  all: []
  hedgehogs: []
  bots: []

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