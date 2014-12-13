(function() {
  var AI, BLOCK, Block, Bot, KEY_CODE, Player, Shell, Tank, animate, entities, i, isCollision, moveShells, player, r, removeShell, renderer, screenSize, shellSpeed, size, stage, step, x, y, _i, _j, _k, _ref, _ref1,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  screenSize = 640;

  step = 32;

  size = screenSize / step;

  stage = new PIXI.Stage(0x3f2700);

  renderer = new PIXI.autoDetectRenderer(screenSize, screenSize);

  document.body.appendChild(renderer.view);

  entities = {
    hedgehogs: [],
    bots: [],
    shells: []
  };

  shellSpeed = 2;

  BLOCK = {
    PLAYER: 'player',
    BOT: 'bot',
    HEDGEHOD: 'hedgehog',
    GROUND: 'ground',
    GRAVEL: 'gravel',
    DIRT: 'dirt',
    GRASS: 'grass',
    PUDDLE: 'puddle',
    SHELL: 'shell'
  };

  KEY_CODE = {
    CTRL: 17,
    ALT: 18,
    ESC: 27,
    SPACE: 32,
    ENTER: 13,
    ARROW: {
      UP: 38,
      LEFT: 37,
      DOWN: 40,
      RIGHT: 39
    },
    W: 87,
    A: 65,
    S: 83,
    D: 68
  };

  Math.randomInt = function(min, max) {
    return Math.floor(Math.random() * (max - min + 1) + min);
  };

  Math.radiansToDegrees = function(r) {
    return r * (180 / Math.PI);
  };

  Math.degreesToRadians = function(d) {
    if (d === 0) {
      d = 360;
    }
    return d * (Math.PI / 180);
  };

  Array.prototype.remove = function(obj) {
    var key, value, _results;
    _results = [];
    for (key in this) {
      value = this[key];
      if (value.i === obj.i) {
        _results.push(this.splice(key, 1));
      } else {
        _results.push(void 0);
      }
    }
    return _results;
  };

  isCollision = function(x1, y1, x2, y2, s1, s2) {
    if (s1 == null) {
      s1 = step;
    }
    if (s2 == null) {
      s2 = step;
    }
    if ((x1 + s1 >= x2 && x1 <= x2 + s2) && (y1 + s1 >= y2 && y1 <= y2 + s2)) {
      return true;
    } else {
      return false;
    }
  };

  Block = (function() {
    function Block(x, y, rotation, type, i) {
      this.x = x;
      this.y = y;
      this.rotation = rotation;
      this.type = type;
      this.i = i != null ? i : stage.children.length;
      this.s = new PIXI.Sprite(PIXI.Texture.fromImage("../textures/" + this.type + ".png"));
      this.s.position.x = this.x * step + step / 2;
      this.s.position.y = this.y * step + step / 2;
      this.s.rotation = Math.degreesToRadians(this.rotation);
      this.s.anchor.x = 0.5;
      this.s.anchor.y = 0.5;
      stage.addChild(this.s);
      switch (this.type) {
        case BLOCK.HEDGEHOD:
          entities.hedgehogs.push(this);
          break;
        case BLOCK.SHELL:
          entities.shells.push(this);
      }
    }

    return Block;

  })();

  Tank = (function(_super) {
    __extends(Tank, _super);

    function Tank(x, y, rotation, type, lives) {
      this.x = x;
      this.y = y;
      this.rotation = rotation;
      this.type = type;
      this.lives = lives;
      Tank.__super__.constructor.call(this, this.x, this.y, this.rotation, this.type);
    }

    Tank.prototype.move = function(x, y, r) {
      var a, rotation, s, _i, _len, _ref;
      rotation = Math.degreesToRadians(r);
      s = stage.children[this.i];
      if (s.rotation !== rotation) {
        this.rotation = r;
        s.rotation = rotation;
        stage.children[this.i] = s;
        return;
      }
      if (s.position.x + x * step < screenSize && s.position.x + x * step > -1 && s.position.y + y * step < screenSize && s.position.y + y * step > -1) {
        this.x += x;
        this.y += y;
        s.position.x += x * step;
        s.position.y += y * step;
        _ref = entities.hedgehogs;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          a = _ref[_i];
          if (this.x === a.x && this.y === a.y) {
            this.applyDamage(1);
          }
        }
        return stage.children[this.i] = s;
      }
    };

    Tank.prototype.applyDamage = function(l) {
      this.lives -= l;
      if (this.lives <= 0) {
        return this.destroy('Tank was destroyed!');
      }
    };

    Tank.prototype.destroy = function(message) {
      this._isAlive = false;
      return console.log(message);
    };

    Tank.prototype.shoot = function() {
      return new Shell(this.x, this.y, this.rotation);
    };

    Tank.prototype._isAlive = true;

    return Tank;

  })(Block);

  Player = (function(_super) {
    __extends(Player, _super);

    function Player(x, y, rotation) {
      this.x = x;
      this.y = y;
      this.rotation = rotation;
      Player.__super__.constructor.call(this, this.x, this.y, this.rotation, BLOCK.PLAYER, 3);
      this.enableControl();
    }

    Player.prototype.enableControl = function() {
      var p;
      p = this;
      return window.onkeydown = function(e) {
        switch (e.keyCode) {
          case KEY_CODE.ARROW.LEFT:
          case KEY_CODE.A:
            return p.move(-1, 0, 270);
          case KEY_CODE.ARROW.UP:
          case KEY_CODE.W:
            return p.move(0, -1, 0);
          case KEY_CODE.ARROW.RIGHT:
          case KEY_CODE.D:
            return p.move(1, 0, 90);
          case KEY_CODE.ARROW.DOWN:
          case KEY_CODE.S:
            return p.move(0, 1, 180);
          case KEY_CODE.SPACE:
            return p.shoot();
        }
      };
    };

    Player.prototype.disableControl = function() {
      return window.onkeydown = null;
    };

    Player.prototype.destroy = function() {
      var a, _i, _len, _ref;
      this.disableControl();
      _ref = entities.bots;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        a = _ref[_i];
        if (a._isAlive === true) {
          AI.disable(a);
          AI.random(a);
        }
      }
      return Player.__super__.destroy.call(this, 'Bye, sir!');
    };

    return Player;

  })(Tank);

  Bot = (function(_super) {
    __extends(Bot, _super);

    function Bot(x, y, rotation) {
      this.x = x;
      this.y = y;
      this.rotation = rotation;
      Bot.__super__.constructor.call(this, this.x, this.y, this.rotation, BLOCK.BOT, 2);
      AI.enable(this);
      entities.bots.push(this);
    }

    Bot.prototype.destroy = function() {
      AI.disable(this);
      return Bot.__super__.destroy.call(this, 'Bye, bot!');
    };

    Bot.prototype._ai = null;

    return Bot;

  })(Tank);

  Shell = (function(_super) {
    __extends(Shell, _super);

    function Shell(x, y, rotation) {
      this.x = x;
      this.y = y;
      this.rotation = rotation;
      Shell.__super__.constructor.call(this, this.x, this.y, this.rotation, BLOCK.SHELL);
    }

    return Shell;

  })(Block);

  removeShell = function(s) {
    entities.shells.remove(s);
    return stage.children.splice(s.i, 1);
  };

  moveShells = function() {
    var a, b, _i, _len, _ref, _results;
    _ref = entities.shells;
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      a = _ref[_i];
      switch (a.rotation) {
        case 0:
          a.s.position.y -= shellSpeed;
          break;
        case 90:
          a.s.position.x += shellSpeed;
          break;
        case 180:
          a.s.position.y += shellSpeed;
          break;
        case 270:
          a.s.position.x -= shellSpeed;
      }
      if (a.s.position.x > screenSize || a.s.position.x < 0 || a.s.position.y > screenSize || a.s.position.y < 0) {
        removeShell(a);
      }
      _results.push((function() {
        var _j, _len1, _ref1, _results1;
        _ref1 = entities.bots;
        _results1 = [];
        for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
          b = _ref1[_j];
          if (isCollision(a.s.position.x, a.s.position.y, b.s.position.x, b.s.position.y) === true && b._isAlive === true) {
            removeShell(a);
            _results1.push(b.applyDamage(1));
          } else {
            _results1.push(void 0);
          }
        }
        return _results1;
      })());
    }
    return _results;
  };

  for (x = _i = 0, _ref = size - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; x = 0 <= _ref ? ++_i : --_i) {
    for (y = _j = 0, _ref1 = size - 1; 0 <= _ref1 ? _j <= _ref1 : _j >= _ref1; y = 0 <= _ref1 ? ++_j : --_j) {
      new Block(x, y, 0, BLOCK.GROUND);
      r = Math.randomInt(0, 100);
      if (r < 10) {
        new Block(x, y, 0, BLOCK.GRAVEL);
      }
      if (r > 10 && r < 20) {
        new Block(x, y, 0, BLOCK.DIRT);
      }
      if (r > 20 && r < 30) {
        new Block(x, y, 0, BLOCK.GRASS);
      }
      if (r === 90) {
        new Block(x, y, 0, BLOCK.PUDDLE);
      }
      if (r > 95) {
        new Block(x, y, 0, BLOCK.HEDGEHOD);
      }
    }
  }

  AI = {
    enable: function(bot) {
      return bot._ai = setInterval(function() {
        var ax, axis, ay, direction;
        ax = +(player.x - bot.x);
        ay = +(player.y - bot.y);
        if (ax < ay) {
          axis = 'x';
          if (player.x > bot.x) {
            direction = 'right';
          } else if (player.x < bot.x) {
            direction = 'left';
          } else if (player.x === bot.x) {
            if (player.y > bot.y) {
              bot.move(0, 0, 180);
            } else if (player.y < bot.y) {
              bot.move(0, 0, 0);
            }
          }
        } else {
          axis = 'y';
          if (player.y > bot.y) {
            direction = 'down';
          } else if (player.y < bot.y) {
            direction = 'up';
          } else if (player.y === bot.y) {
            if (player.x > bot.x) {
              bot.move(0, 0, 90);
            } else if (player.x < bot.x) {
              bot.move(0, 0, 270);
            }
          }
        }
        switch (direction) {
          case 'up':
            return bot.move(0, -1, 0);
          case 'right':
            return bot.move(1, 0, 90);
          case 'down':
            return bot.move(0, 1, 180);
          case 'left':
            return bot.move(-1, 0, 270);
        }
      }, 500);
    },
    disable: function(bot) {
      return clearInterval(bot._ai);
    },
    random: function(bot) {
      return bot._ai = setInterval(function() {
        var direction;
        direction = Math.randomInt(0, 3);
        switch (direction) {
          case 0:
            return bot.move(0, -1, 0);
          case 1:
            return bot.move(1, 0, 90);
          case 2:
            return bot.move(0, 1, 180);
          case 3:
            return bot.move(-1, 0, 270);
        }
      }, 1000);
    }
  };

  player = new Player(Math.randomInt(0, size - 1), Math.randomInt(0, size - 1), 0);

  for (i = _k = 0; _k <= 9; i = ++_k) {
    new Bot(Math.randomInt(0, size - 1), Math.randomInt(0, size - 1), 0);
  }

  animate = function() {
    requestAnimFrame(animate);
    moveShells();
    return renderer.render(stage);
  };

  requestAnimFrame(animate);

}).call(this);
