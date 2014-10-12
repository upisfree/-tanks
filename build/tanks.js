(function(){var a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y={}.hasOwnProperty,z=function(a,b){function c(){this.constructor=a}for(var d in b)y.call(b,d)&&(a[d]=b[d]);return c.prototype=b.prototype,a.prototype=new c,a.__super__=b.prototype,a};for(i=document.getElementsByTagName("canvas")[0],j=i.getContext("2d"),p=640,r=32,q=p/r,g=[],d={CTRL:17,ALT:18,ESC:27,SPACE:32,ENTER:13,ARROW:{UP:38,LEFT:37,DOWN:40,RIGHT:39},W:87,A:65,S:83,D:68},Math.randomInt=function(a,b){return Math.floor(Math.random()*(b-a+1)+a)},k=function(a,b,c){var d;return d=new Image,d.src="../textures/"+c+".png",d.onload=function(){return j.drawImage(d,a,b)}},l=function(a,b,c,d){var e;return e=new Image,e.src="../textures/"+c+".png",e.onload=function(){var c;return j.save(),c=Math.PI/180,0!==d&&(c*=d),j.translate(a,b),j.rotate(c),j.drawImage(e,-e.width/2,-e.height/2),j.restore()}},o=function(){var a,b,c,d;for(d=[],b=0,c=g.length;c>b;b++)a=g[b],d.push(k(a.x*r,a.y*r,a.type));return d},b=function(){function a(a,b,c){this.x=a,this.y=b,this.type=c,this.i=g.length}return a}(),f=function(a){function b(a,b,c,d,e){this.x=a,this.y=b,this.type=c,this.lives=d,this.deg=e}return z(b,a),b.prototype.move=function(a,b,c){var d,e,f,h;if(c&&(this.deg=c),this.x+a<q&&this.x+a>-1&&this.y+b<q&&this.y+b>-1){for(this.x+=a,this.y+=b,g[this.i]=this,h=[],e=0,f=g.length;f>e;e++)d=g[e],h.push(this.x===d.x&&this.y===d.y&&"hedgehog"===d.type?this.applyDamage(1):void 0);return h}},b.prototype.applyDamage=function(a){return this.lives-=a,this.lives<=0?this.destroy("Tank was destroyed!"):void 0},b.prototype.destroy=function(a){return console.log(a)},b}(b),e=function(a){function b(){return b.__super__.constructor.apply(this,arguments)}return z(b,a),b.prototype.enableControl=function(){return window.onkeydown=function(a){switch(a.keyCode){case d.ARROW.LEFT:case d.A:return m.move(-1,0,270);case d.ARROW.UP:case d.W:return m.move(0,-1,0);case d.ARROW.RIGHT:case d.D:return m.move(1,0,90);case d.ARROW.DOWN:case d.S:return m.move(0,1,180)}}},b.prototype.disableControl=function(){return window.onkeydown=null},b.prototype.destroy=function(){return this.disableControl(),b.__super__.destroy.call(this,"Bye, sir!")},b}(f),c=function(b){function c(){return c.__super__.constructor.apply(this,arguments)}return z(c,b),c.prototype._ai=null,c.prototype.destroy=function(){return a.disable(this),c.__super__.destroy.call(this,"Bye, bot!")},c}(f),w=s=0,u=q-1;u>=0?u>=s:s>=u;w=u>=0?++s:--s)for(x=t=0,v=q-1;v>=0?v>=t:t>=v;x=v>=0?++t:--t)g.push(new b(w,x,"ground")),n=Math.randomInt(0,100),10>n&&g.push(new b(w,x,"ground2")),n>10&&20>n&&g.push(new b(w,x,"ground3")),n>20&&30>n&&g.push(new b(w,x,"ground4")),90===n&&g.push(new b(w,x,"puddle")),n>95&&g.push(new b(w,x,"hedgehog"));a={enable:function(a){return a._ai=setInterval(function(){return a.move(Math.randomInt(-1,1),Math.randomInt(-1,1))},500)},disable:function(a){return clearInterval(a._ai)}},m=new e(Math.randomInt(0,q-1),Math.randomInt(0,q-1),"player",3),m.enableControl(),g.push(m),h=new c(Math.randomInt(0,q-1),Math.randomInt(0,q-1),"bot",1),a.enable(h),g.push(h),setInterval(function(){return o()},16)}).call(this);