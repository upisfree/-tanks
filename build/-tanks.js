(function(){var a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y={}.hasOwnProperty,z=function(a,b){function c(){this.constructor=a}for(var d in b)y.call(b,d)&&(a[d]=b[d]);return c.prototype=b.prototype,a.prototype=new c,a.__super__=b.prototype,a};for(n={debug:!1,path:"./-tanks/"},Matter.RenderPixi.create=function(a){var b,c;return b={controller:Matter.RenderPixi,element:null,canvas:null,options:{width:800,height:600,background:"#fafafa",wireframeBackground:"#222",enabled:!0,wireframes:!0,showSleeping:!0,showDebug:!1,showBroadphase:!1,showBounds:!1,showVelocity:!1,showCollisions:!1,showAxes:!1,showPositions:!1,showAngleIndicator:!1,showIds:!1,showShadows:!1}},c=Matter.Common.extend(b,a),c.context=new PIXI.WebGLRenderer(c.options.width,c.options.height,c.canvas,!1,!0),c.canvas=c.context.view,c.stage=new PIXI.Stage,c.textures={},c.sprites={},c.primitives={},c.spriteBatch=new PIXI.DisplayObjectContainer,c.stage.addChild(c.spriteBatch),Matter.Common.isElement(c.element)?c.element.appendChild(c.canvas):Matter.Common.log('No "render.element" passed, "render.canvas" was not inserted into document.',"warn"),c.canvas.oncontextmenu=c.canvas.onselectstart=function(){return!1},c},Matter.RenderPixi.world=function(a){var b,c,d,e,f,g,h,i,j,k,l,m,n,o,p;for(h=a.render,j=a.world,f=a.map,d=h.context,i=h.stage,g=h.options,b=Matter.Composite.allBodies(j),c=Matter.Composite.allConstraints(j),k=0,n=f.length;n>k;k++)e=f[k],h.spriteBatch.addChildAt(e.sprite,0);for(l=0,o=b.length;o>l;l++)e=b[l],Matter.RenderPixi.body(a,e);for(m=0,p=c.length;p>m;m++)e=c[m],Matter.RenderPixi.constraint(a,e);return d.render(i)},Matter.RenderPixi.body=function(a,b){var c,d,e,f,g,h,i,j;if(d=a.render,c=b.render,f=d.spriteBatch,c.visible){if(c.tank){for(-1===f.children.indexOf(c.tank)&&f.addChild(c.tank),j=c.tank.children,h=0,i=j.length;i>h;h++)e=j[h],e.position.x=b.position.x,e.position.y=b.position.y;c.tank.children[0].rotation=b.angle}return c.sprite&&c.sprite.texture?(g="b-"+b.id,e=d.sprites[g],e||(e=d.sprites[g]=Matter.RenderPixi._createBodySprite(d,b)),-1===f.children.indexOf(e)&&f.addChild(e),e.position.x=b.position.x,e.position.y=b.position.y,e.rotation=b.angle):void 0}},Matter.RenderPixi._getTexture=function(a,b){var c;return c=a.textures[b],c||(c=a.textures[b]=PIXI.Texture.fromImage(b)),c},Matter.RenderPixi._createBodySprite=function(a,b){var c,d,e,f;return c=b.render,f=c.sprite.texture,e=Matter.RenderPixi._getTexture(a,f),d=new PIXI.Sprite(e),d.anchor.x=.5,d.anchor.y=.5,d},w=32,v={x:(window.innerWidth/w).toFixed(),y:(window.innerHeight/w).toFixed()},s={x:v.x*w,y:v.y*w},f={position:{x:0,y:0}},o=Matter.Engine.create(document.body,{world:{gravity:{x:0,y:0},bounds:{min:{x:-1/0,y:-1/0},max:{x:1/0,y:1/0}}},enableSleeping:!0,render:{controller:Matter.RenderPixi,options:{width:s.x,height:s.y,wireframes:!1}},map:[]}),p={tanks:[]},b={PLAYER:"player",BOT:"bot",HEDGEHOD:"hedgehog",GROUND:"ground",GRAVEL:"gravel",DIRT:"dirt",GRASS:"grass",PUDDLE:"puddle",SHELL:"shell"},Math.randomInt=function(a,b){return Math.floor(Math.random()*(b-a+1)+a)},Math.radiansToDegrees=function(a){return a*(180/Math.PI)},Math.degreesToRadians=function(a){return a*(Math.PI/180)},m=Matter.Vector,m.fromAngle=function(a){return a-=Math.PI/2,{x:Math.cos(a),y:Math.sin(a)}},Array.prototype.remove=function(a){var b,c,d;d=[];for(b in this)c=this[b],d.push(c.i===a.i?this.splice(b,1):void 0);return d},c=function(){function a(a,c,d,e,f){switch(this.x=a,this.y=c,this.rotation=d,this.type=e,this.i=null!=f?f:container.children.length,this.s=new PIXI.Sprite(PIXI.Texture.fromImage("../assets/textures/"+this.type+".png")),this.s.position.x=this.x*w+w/2,this.s.position.y=this.y*w+w/2,this.s.rotation=Math.degreesToRadians(this.rotation),this.s.anchor.x=.5,this.s.anchor.y=.5,o.render.addChild(this.s),this.type){case b.HEDGEHOD:p.hedgehogs.push(this);break;case b.SHELL:p.shells.push(this)}}return a}(),l=function(a){function b(a,c,d,e,f){this.x=a,this.y=c,this.rotation=d,this.type=e,this.lives=f,b.__super__.constructor.call(this,this.x,this.y,this.rotation,this.type)}return z(b,a),b.prototype.move=function(a,b,c){var d,e,f,g,h,i;if(e=Math.degreesToRadians(c),f=container.children[this.i],f.rotation!==e)return this.rotation=c,f.rotation=e,void(container.children[this.i]=f);if(f.position.x+a*w<s.x&&f.position.x+a*w>-1&&f.position.y+b*w<s.y&&f.position.y+b*w>-1){for(this.x+=a,this.y+=b,f.position.x+=a*w,f.position.y+=b*w,i=p.hedgehogs,g=0,h=i.length;h>g;g++)d=i[g],this.x===d.x&&this.y===d.y&&this.applyDamage(1);return container.children[this.i]=f}},b.prototype.applyDamage=function(a){return this.lives-=a,this.lives<=0?this.destroy("Tank was destroyed!"):void 0},b.prototype.destroy=function(a){return this._isAlive=!1,console.log(a)},b.prototype.shoot=function(){return Date.now()-this._lastShoot>=2e3?(new i(this.x,this.y,this.rotation),this._lastShoot=Date.now()):void 0},b.prototype._isAlive=!0,b.prototype._lastShoot=Date.now(),b}(c),i=function(){function a(a){var b,c,d;this.tank=a,d=m.fromAngle(this.tank.body.turretRotation),b=this.tank.body.position.x+20*d.x,c=this.tank.body.position.y+20*d.y,this.body=Matter.Bodies.rectangle(b,c,7,14,{angle:this.tank.body.turretRotation,friction:1,frictionAir:.1,mass:1e3,render:{sprite:{texture:"assets/textures/tanks/shell.png"}}}),this.body.label="shell-"+this.tank.body.id,Matter.Composite.add(o.world,this.body),Matter.Body.applyForce(this.body,{x:0,y:0},m.mult(d,200)),Matter.Body.applyForce(this.tank.body,{x:0,y:0},m.neg(m.mult(d,50))),Matter.Events.on(o,"collisionEnd",function(a){var b,c,d,e,f;for(c=a.pairs,f=[],d=0,e=c.length;e>d;d++)b=c[d],f.push(console.log(b.bodyA.label+":"+b.bodyB.label));return f})}return a}(),j=function(a){function c(a,d,e){switch(this.x=a,this.y=d,this.rotation=e,this.rotation){case 0:--this.y;break;case 90:++this.x;break;case 180:++this.y;break;case 270:--this.x}c.__super__.constructor.call(this,this.x,this.y,this.rotation,b.SHELL)}return z(c,a),c}(c),u={speed:2,remove:function(a){return p.shells.remove(a),container.children.splice(a.i,1)},moveAll:function(){var a,b,c,d,e,f,g,h,i;for(g=p.shells,i=[],c=0,e=g.length;e>c;c++){switch(a=g[c],a.rotation){case 0:a.s.position.y-=u.speed;break;case 90:a.s.position.x+=u.speed;break;case 180:a.s.position.y+=u.speed;break;case 270:a.s.position.x-=u.speed}for((a.s.position.x>s.x||a.s.position.x<0||a.s.position.y>s.y||a.s.position.y<0)&&u.remove(a),h=p.bots,d=0,f=h.length;f>d;d++)b=h[d],isCollision(a.s.position.x,a.s.position.y,b.s.position.x,b.s.position.y)===!0&&b._isAlive===!0&&(u.remove(a),b.applyDamage(1));i.push(function(){var c,d,e,f;for(e=p.players,f=[],c=0,d=e.length;d>c;c++)b=e[c],isCollision(a.s.position.x,a.s.position.y,b.s.position.x,b.s.position.y)===!0&&b._isAlive===!0?(u.remove(a),f.push(b.applyDamage(1))):f.push(void 0);return f}())}return i}},e={Cell:function(){function a(a,b,c,d){this.x=a,this.y=b,this.type=c,this.rotation=null!=d?d:0,this.sprite=new PIXI.Sprite(PIXI.Texture.fromImage("assets/textures/map/"+this.type+".png")),this.sprite.position.x=this.x*w+w/2,this.sprite.position.y=this.y*w+w/2,this.sprite.rotation=Math.degreesToRadians(this.rotation),this.sprite.anchor.x=.5,this.sprite.anchor.y=.5,o.map.push(this)}return a}(),generate:function(){var a,c,d,f,g,h;for(h=[],c=f=0,g=v.x;g>=0?g>=f:f>=g;c=g>=0?++f:--f)h.push(function(){var f,g,h;for(h=[],d=f=0,g=v.y;g>=0?g>=f:f>=g;d=g>=0?++f:--f)a=Math.randomInt(0,100),h.push(10>a?new e.Cell(c,d,b.GRAVEL):a>10&&20>a?new e.Cell(c,d,b.DIRT):a>20&&30>a?new e.Cell(c,d,b.GRASS):90===a?new e.Cell(c,d,b.PUDDLE):new e.Cell(c,d,b.GROUND));return h}());return h}},k=function(){function a(a,b,c,d,e){var f,g;this.texture=c,this.width=null!=d?d:25,this.height=null!=e?e:23,this.body=Matter.Bodies.rectangle(a,b,this.width,this.height,{friction:1,frictionAir:.1,mass:1e4,render:{tank:null}}),this.body.label="tank-"+this.body.id,this.body.render.tank=new PIXI.DisplayObjectContainer,f=new PIXI.Sprite(PIXI.Texture.fromImage("assets/textures/tanks/"+this.texture+"/base.png")),f.position={x:a,y:b},f.anchor={x:.5,y:.5},g=new PIXI.Sprite(PIXI.Texture.fromImage("assets/textures/tanks/"+this.texture+"/turret.png")),g.position={x:a,y:b},g.anchor={x:.5,y:.73},this.body.render.tank.addChild(f),this.body.render.tank.addChild(g),Matter.Composite.add(o.world,this.body)}return a.prototype.move=function(a){return Matter.Body.applyForce(this.body,{x:0,y:0},m.mult(a,10))},a.prototype.shoot=function(){return new i(this),this._lastShoot=Date.now()},a.prototype.applyDamage=function(a){return this.lives-=a,this.lives<=0?this.destroy("Tank was destroyed!"):void 0},a.prototype.destroy=function(a){return this._isAlive=!1,console.log(a)},a.prototype._isAlive=!0,a.prototype._lastShoot=Date.now(),a}(),g=function(a){function b(a,c){b.__super__.constructor.call(this,a,c,"player"),this.enableMouse(this),this.enableKeyboard(this)}return z(b,a),b.prototype.enableKeyboard=function(a){return Mousetrap.bind(["w","up"],function(){return a.move(m.fromAngle(a.body.angle))}),Mousetrap.bind(["s","down"],function(){return a.move(m.neg(m.fromAngle(a.body.angle)))}),Mousetrap.bind(["a","left"],function(){return Matter.Body.rotate(a.body,Math.degreesToRadians(-2))}),Mousetrap.bind(["d","right"],function(){return Matter.Body.rotate(a.body,Math.degreesToRadians(2))})},b.prototype.enableMouse=function(a){return window.onmousemove=function(b){return f.position={x:b.x,y:b.y},a.body.render.tank.children[1].rotation=a.body.turretRotation=Math.atan2(a.body.position.y-b.y,a.body.position.x-b.x)-Math.PI/2},window.onclick=function(){return a.shoot()}},b}(k),h=function(c){function d(a,c,e){this.x=a,this.y=c,this.rotation=e,d.__super__.constructor.call(this,this.x,this.y,this.rotation,b.PLAYER,3),this.enableControl(),p.players.push(this)}return z(d,c),d.prototype.enableControl=function(){var a;return a=this,window.onkeydown=function(b){switch(b.keyCode){case KEY_CODE.ARROW.LEFT:case KEY_CODE.A:return a.move(-1,0,270);case KEY_CODE.ARROW.UP:case KEY_CODE.W:return a.move(0,-1,0);case KEY_CODE.ARROW.RIGHT:case KEY_CODE.D:return a.move(1,0,90);case KEY_CODE.ARROW.DOWN:case KEY_CODE.S:return a.move(0,1,180);case KEY_CODE.SPACE:return a.shoot()}}},d.prototype.disableControl=function(){return window.onkeydown=null},d.prototype.destroy=function(){var b,c,e,f;for(this.disableControl(),f=p.bots,c=0,e=f.length;e>c;c++)b=f[c],b._isAlive===!0&&(a.disable(b),a.random(b));return d.__super__.destroy.call(this,"Bye, sir!")},d}(k),t=function(){return window.container=container},d=function(c){function d(c,e,f){this.x=c,this.y=e,this.rotation=f,d.__super__.constructor.call(this,this.x,this.y,this.rotation,b.BOT,2),a.enable(this),p.bots.push(this)}return z(d,c),d.prototype.destroy=function(){return a.disable(this),d.__super__.destroy.call(this,"Bye, bot!")},d.prototype._ai=null,d}(k),a={enable:function(a){return a._ai=setInterval(function(){var b,c,d,e;switch(b=+(player.x-a.x),d=+(player.y-a.y),d>b?(c="x",player.x>a.x?e="right":player.x<a.x?e="left":player.x===a.x&&(player.y>a.y?a.move(0,0,180):player.y<a.y&&a.move(0,0,0))):(c="y",player.y>a.y?e="down":player.y<a.y?e="up":player.y===a.y&&(player.x>a.x?a.move(0,0,90):player.x<a.x&&a.move(0,0,270))),e){case"up":a.move(0,-1,0);break;case"right":a.move(1,0,90);break;case"down":a.move(0,1,180);break;case"left":a.move(-1,0,270)}return a.shoot()},500)},disable:function(a){return clearInterval(a._ai)},random:function(a){return a._ai=setInterval(function(){var b;switch(b=Math.randomInt(0,3)){case 0:return a.move(0,-1,0);case 1:return a.move(1,0,90);case 2:return a.move(0,1,180);case 3:return a.move(-1,0,270)}},1e3)}},Matter.Engine.run(o),n.debug===!1&&(q={pixel:new PIXI.PixelateFilter},q.pixel.size={x:3,y:3},o.render.spriteBatch.filters=[q.pixel]),r=x=0;100>=x;r=++x)new k(Math.randomInt(0,s.x),Math.randomInt(0,s.y),"bot");new g(s.x/2,s.y/2),e.generate(),Matter.Events.on(o,"tick",function(){return window.engine=o})}).call(this);