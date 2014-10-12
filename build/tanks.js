(function(){var a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z={}.hasOwnProperty,A=function(a,b){function c(){this.constructor=a}for(var d in b)z.call(b,d)&&(a[d]=b[d]);return c.prototype=b.prototype,a.prototype=new c,a.__super__=b.prototype,a};for(i=document.getElementsByTagName("canvas")[0],j=i.getContext("2d"),p=640,r=32,q=p/r,g=[],d={CTRL:17,ALT:18,ESC:27,SPACE:32,ENTER:13,ARROW:{UP:38,LEFT:37,DOWN:40,RIGHT:39},W:87,A:65,S:83,D:68},Math.randomInt=function(a,b){return Math.floor(Math.random()*(b-a+1)+a)},k=function(a,b,c,d){var e;return e=new Image,e.src="../textures/"+c+".png",e.onload=function(){var c;return j.save(),null!=d?(c=Math.PI/180*d,j.translate(a+r/2,b+r/2),j.rotate(c),j.drawImage(e,-e.width/2,-e.height/2,e.width,e.height)):j.drawImage(e,a,b),j.restore()}},o=function(){var a,b,c,d;for(d=[],b=0,c=g.length;c>b;b++)a=g[b],d.push(k(a.x*r,a.y*r,a.type,a.deg?a.deg:void 0));return d},b=function(){function a(a,b,c){this.x=a,this.y=b,this.type=c,this.i=g.length}return a}(),f=function(a){function b(a,b,c,d,e){this.x=a,this.y=b,this.type=c,this.lives=d,this.deg=e}return A(b,a),b.prototype.move=function(a,b,c){var d,e,f,h;if(c&&(this.deg=c),this.x+a<q&&this.x+a>-1&&this.y+b<q&&this.y+b>-1){for(this.x+=a,this.y+=b,g[this.i]=this,h=[],e=0,f=g.length;f>e;e++)d=g[e],h.push(this.x===d.x&&this.y===d.y&&"hedgehog"===d.type?this.applyDamage(1):void 0);return h}},b.prototype.applyDamage=function(a){return this.lives-=a,this.lives<=0?this.destroy("Tank was destroyed!"):void 0},b.prototype.destroy=function(a){return console.log(a)},b}(b),e=function(a){function b(){return b.__super__.constructor.apply(this,arguments)}return A(b,a),b.prototype.enableControl=function(){return window.onkeydown=function(a){switch(a.keyCode){case d.ARROW.LEFT:case d.A:return m.move(-1,0,270);case d.ARROW.UP:case d.W:return m.move(0,-1,360);case d.ARROW.RIGHT:case d.D:return m.move(1,0,90);case d.ARROW.DOWN:case d.S:return m.move(0,1,180)}}},b.prototype.disableControl=function(){return window.onkeydown=null},b.prototype.destroy=function(){return this.disableControl(),b.__super__.destroy.call(this,"Bye, sir!")},b}(f),c=function(b){function c(){return c.__super__.constructor.apply(this,arguments)}return A(c,b),c.prototype._ai=null,c.prototype.destroy=function(){return a.disable(this),c.__super__.destroy.call(this,"Bye, bot!")},c}(f),x=s=0,v=q-1;v>=0?v>=s:s>=v;x=v>=0?++s:--s)for(y=t=0,w=q-1;w>=0?w>=t:t>=w;y=w>=0?++t:--t)g.push(new b(x,y,"ground")),n=Math.randomInt(0,100),10>n&&g.push(new b(x,y,"ground2")),n>10&&20>n&&g.push(new b(x,y,"ground3")),n>20&&30>n&&g.push(new b(x,y,"ground4")),90===n&&g.push(new b(x,y,"puddle")),n>95&&g.push(new b(x,y,"hedgehog"));for(a={enable:function(a){return a._ai=setInterval(function(){var b,c,d,e,f,g,h;switch(b=+(m.x-a.x),d=+(m.y-a.y),d>b?(c="x",m.x>a.x?f="right":m.x<a.x?f="left":m.x===a.x&&console.log("Catch you on x axis")):(c="y",m.y>a.y?f="down":m.y<a.y?f="up":m.y===a.y&&console.log("Catch you on y axis!")),f){case"up":g=0,h=-1,e=360;break;case"right":g=1,h=0,e=90;break;case"down":g=0,h=1,e=180;break;case"left":g=-1,h=0,e=270}return a.move(g,h,e)},500)},disable:function(a){return clearInterval(a._ai)}},m=new e(Math.randomInt(0,q-1),Math.randomInt(0,q-1),"player",3),m.enableControl(),g.push(m),l=u=0;1>=u;l=++u)h=new c(Math.randomInt(0,q-1),Math.randomInt(0,q-1),"bot",1),a.enable(h),g.push(h);setInterval(function(){return o()},16)}).call(this);