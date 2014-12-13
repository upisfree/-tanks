(function(){var a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D={}.hasOwnProperty,E=function(a,b){function c(){this.constructor=a}for(var d in b)D.call(b,d)&&(a[d]=b[d]);return c.prototype=b.prototype,a.prototype=new c,a.__super__=b.prototype,a};for(r=640,v=32,t=r/v,u=new PIXI.Stage(4138752),q=new PIXI.autoDetectRenderer(r,r),document.body.appendChild(q.view),j={hedgehogs:[],bots:[],shells:[]},s=2,b={PLAYER:"player",BOT:"bot",HEDGEHOD:"hedgehog",GROUND:"ground",GRAVEL:"gravel",DIRT:"dirt",GRASS:"grass",PUDDLE:"puddle",SHELL:"shell"},e={CTRL:17,ALT:18,ESC:27,SPACE:32,ENTER:13,ARROW:{UP:38,LEFT:37,DOWN:40,RIGHT:39},W:87,A:65,S:83,D:68},Math.randomInt=function(a,b){return Math.floor(Math.random()*(b-a+1)+a)},Math.radiansToDegrees=function(a){return a*(180/Math.PI)},Math.degreesToRadians=function(a){return 0===a&&(a=360),a*(Math.PI/180)},Array.prototype.remove=function(a){var b,c,d;d=[];for(b in this)c=this[b],d.push(c.i===a.i?this.splice(b,1):void 0);return d},l=function(a,b,c,d,e,f){return null==e&&(e=v),null==f&&(f=v),a+e>=c&&c+f>=a&&b+e>=d&&d+f>=b?!0:!1},c=function(){function a(a,c,d,e,f){switch(this.x=a,this.y=c,this.rotation=d,this.type=e,this.i=null!=f?f:u.children.length,this.s=new PIXI.Sprite(PIXI.Texture.fromImage("../assets/textures/"+this.type+".png")),this.s.position.x=this.x*v+v/2,this.s.position.y=this.y*v+v/2,this.s.rotation=Math.degreesToRadians(this.rotation),this.s.anchor.x=.5,this.s.anchor.y=.5,u.addChild(this.s),this.type){case b.HEDGEHOD:j.hedgehogs.push(this);break;case b.SHELL:j.shells.push(this)}}return a}(),h=function(a){function b(a,c,d,e,f){this.x=a,this.y=c,this.rotation=d,this.type=e,this.lives=f,b.__super__.constructor.call(this,this.x,this.y,this.rotation,this.type)}return E(b,a),b.prototype.move=function(a,b,c){var d,e,f,g,h,i;if(e=Math.degreesToRadians(c),f=u.children[this.i],f.rotation!==e)return this.rotation=c,f.rotation=e,void(u.children[this.i]=f);if(f.position.x+a*v<r&&f.position.x+a*v>-1&&f.position.y+b*v<r&&f.position.y+b*v>-1){for(this.x+=a,this.y+=b,f.position.x+=a*v,f.position.y+=b*v,i=j.hedgehogs,g=0,h=i.length;h>g;g++)d=i[g],this.x===d.x&&this.y===d.y&&this.applyDamage(1);return u.children[this.i]=f}},b.prototype.applyDamage=function(a){return this.lives-=a,this.lives<=0?this.destroy("Tank was destroyed!"):void 0},b.prototype.destroy=function(a){return this._isAlive=!1,console.log(a)},b.prototype.shoot=function(){return Date.now()-this._lastShoot>=2e3?(new g(this.x,this.y,this.rotation),this._lastShoot=Date.now()):void 0},b.prototype._isAlive=!0,b.prototype._lastShoot=Date.now(),b}(c),g=function(a){function c(a,d,e){this.x=a,this.y=d,this.rotation=e,c.__super__.constructor.call(this,this.x,this.y,this.rotation,b.SHELL)}return E(c,a),c}(c),p=function(a){return j.shells.remove(a),u.children.splice(a.i,1)},m=function(){var a,b,c,d,e,f;for(e=j.shells,f=[],c=0,d=e.length;d>c;c++){switch(a=e[c],a.rotation){case 0:a.s.position.y-=s;break;case 90:a.s.position.x+=s;break;case 180:a.s.position.y+=s;break;case 270:a.s.position.x-=s}(a.s.position.x>r||a.s.position.x<0||a.s.position.y>r||a.s.position.y<0)&&p(a),f.push(function(){var c,d,e,f;for(e=j.bots,f=[],c=0,d=e.length;d>c;c++)b=e[c],l(a.s.position.x,a.s.position.y,b.s.position.x,b.s.position.y)===!0&&b._isAlive===!0?(p(a),f.push(b.applyDamage(1))):f.push(void 0);return f}())}return f},w=y=0,B=t-1;B>=0?B>=y:y>=B;w=B>=0?++y:--y)for(x=z=0,C=t-1;C>=0?C>=z:z>=C;x=C>=0?++z:--z)new c(w,x,0,b.GROUND),o=Math.randomInt(0,100),10>o&&new c(w,x,0,b.GRAVEL),o>10&&20>o&&new c(w,x,0,b.DIRT),o>20&&30>o&&new c(w,x,0,b.GRASS),90===o&&new c(w,x,0,b.PUDDLE),o>95&&new c(w,x,0,b.HEDGEHOD);for(f=function(c){function d(a,c,e){this.x=a,this.y=c,this.rotation=e,d.__super__.constructor.call(this,this.x,this.y,this.rotation,b.PLAYER,3),this.enableControl()}return E(d,c),d.prototype.enableControl=function(){var a;return a=this,window.onkeydown=function(b){switch(b.keyCode){case e.ARROW.LEFT:case e.A:return a.move(-1,0,270);case e.ARROW.UP:case e.W:return a.move(0,-1,0);case e.ARROW.RIGHT:case e.D:return a.move(1,0,90);case e.ARROW.DOWN:case e.S:return a.move(0,1,180);case e.SPACE:return a.shoot()}}},d.prototype.disableControl=function(){return window.onkeydown=null},d.prototype.destroy=function(){var b,c,e,f;for(this.disableControl(),f=j.bots,c=0,e=f.length;e>c;c++)b=f[c],b._isAlive===!0&&(a.disable(b),a.random(b));return d.__super__.destroy.call(this,"Bye, sir!")},d}(h),d=function(c){function d(c,e,f){this.x=c,this.y=e,this.rotation=f,d.__super__.constructor.call(this,this.x,this.y,this.rotation,b.BOT,2),a.enable(this),j.bots.push(this)}return E(d,c),d.prototype.destroy=function(){return a.disable(this),d.__super__.destroy.call(this,"Bye, bot!")},d.prototype._ai=null,d}(h),a={enable:function(a){return a._ai=setInterval(function(){var b,c,d,e;switch(b=+(n.x-a.x),d=+(n.y-a.y),d>b?(c="x",n.x>a.x?e="right":n.x<a.x?e="left":n.x===a.x&&(n.y>a.y?a.move(0,0,180):n.y<a.y&&a.move(0,0,0))):(c="y",n.y>a.y?e="down":n.y<a.y?e="up":n.y===a.y&&(n.x>a.x?a.move(0,0,90):n.x<a.x&&a.move(0,0,270))),e){case"up":return a.move(0,-1,0);case"right":return a.move(1,0,90);case"down":return a.move(0,1,180);case"left":return a.move(-1,0,270)}},500)},disable:function(a){return clearInterval(a._ai)},random:function(a){return a._ai=setInterval(function(){var b;switch(b=Math.randomInt(0,3)){case 0:return a.move(0,-1,0);case 1:return a.move(1,0,90);case 2:return a.move(0,1,180);case 3:return a.move(-1,0,270)}},1e3)}},n=new f(Math.randomInt(0,t-1),Math.randomInt(0,t-1),0),k=A=0;9>=A;k=++A)new d(Math.randomInt(0,t-1),Math.randomInt(0,t-1),0);i=function(){return requestAnimFrame(i),m(),q.render(u)},requestAnimFrame(i)}).call(this);