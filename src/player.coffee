player = new Block 0, 10, 'player'
blocks.push player

window.onkeydown = (e) ->
  switch e.keyCode
    when KEY_CODE.ARROW.LEFT,  KEY_CODE.A
      console.log player.move -1, 0
    when KEY_CODE.ARROW.UP,    KEY_CODE.W
      console.log player.move 0, -1
    when KEY_CODE.ARROW.RIGHT, KEY_CODE.D
      console.log player.move 1, 0
    when KEY_CODE.ARROW.DOWN,  KEY_CODE.S
      console.log player.move 0, 1