(function(){var a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A={}.hasOwnProperty,B=function(a,b){function c(){this.constructor=a}for(var d in b)A.call(b,d)&&(a[d]=b[d]);return c.prototype=b.prototype,a.prototype=new c,a.__super__=b.prototype,a};for(j=document.getElementsByTagName("canvas")[0],k=j.getContext("2d"),q=640,s=32,r=q/s,h=[],d={CTRL:17,ALT:18,ESC:27,SPACE:32,ENTER:13,ARROW:{UP:38,LEFT:37,DOWN:40,RIGHT:39},W:87,A:65,S:83,D:68},Math.randomInt=function(a,b){return Math.floor(Math.random()*(b-a+1)+a)},g=function(){function a(a,b,c){this.x=a,this.y=b,this.deg=c,0===this.deg&&(this.deg=360)}return a}(),l=function(a,b){var c;return c=new Image,c.src="../textures/"+b+".png",c.onload=function(){var d;return k.save(),"player"===b||"bot"===b?(d=Math.PI/180*a.deg,k.translate(a.x+s/2,a.y+s/2),k.rotate(d),k.drawImage(c,-c.width/2,-c.height/2,c.width,c.height)):k.drawImage(c,a.x,a.y),k.restore()}},p=function(){var a,b,c,d;for(d=[],b=0,c=h.length;c>b;b++)a=h[b],d.push(l(new g(a.v.x*s,a.v.y*s,a.v.deg),a.type));return d},b=function(){function a(a,b){this.v=a,this.type=b,this.i=h.length}return a}(),f=function(a){function b(a,b,c){this.v=a,this.type=b,this.lives=c}return B(b,a),b.prototype.move=function(a){var b,c,d,e,f,g,i;if(d=a.x,e=a.y,b=a.deg,b&&(this.v.deg=b),this.v.x+d<r&&this.v.x+d>-1&&this.v.y+e<r&&this.v.y+e>-1){for(this.v.x+=d,this.v.y+=e,h[this.i]=this,i=[],f=0,g=h.length;g>f;f++)c=h[f],i.push(this.v.x===c.v.x&&this.v.y===c.v.y&&"hedgehog"===c.type?this.applyDamage(1):void 0);return i}},b.prototype.applyDamage=function(a){return this.lives-=a,this.lives<=0?this.destroy("Tank was destroyed!"):void 0},b.prototype.destroy=function(a){return console.log(a)},b}(b),e=function(a){function b(){return b.__super__.constructor.apply(this,arguments)}return B(b,a),b.prototype.enableControl=function(){return window.onkeydown=function(a){switch(a.keyCode){case d.ARROW.LEFT:case d.A:return n.move(new g(-1,0,270));case d.ARROW.UP:case d.W:return n.move(new g(0,-1,0));case d.ARROW.RIGHT:case d.D:return n.move(new g(1,0,90));case d.ARROW.DOWN:case d.S:return n.move(new g(0,1,180))}}},b.prototype.disableControl=function(){return window.onkeydown=null},b.prototype.destroy=function(){return this.disableControl(),b.__super__.destroy.call(this,"Bye, sir!")},b}(f),c=function(b){function c(){return c.__super__.constructor.apply(this,arguments)}return B(c,b),c.prototype._ai=null,c.prototype.destroy=function(){return a.disable(this),c.__super__.destroy.call(this,"Bye, bot!")},c}(f),y=t=0,w=r-1;w>=0?w>=t:t>=w;y=w>=0?++t:--t)for(z=u=0,x=r-1;x>=0?x>=u:u>=x;z=x>=0?++u:--u)h.push(new b(new g(y,z,0),"ground")),o=Math.randomInt(0,100),10>o&&h.push(new b(new g(y,z,0),"ground2")),o>10&&20>o&&h.push(new b(new g(y,z,0),"ground3")),o>20&&30>o&&h.push(new b(new g(y,z,0),"ground4")),90===o&&h.push(new b(new g(y,z,0),"puddle")),o>95&&h.push(new b(new g(y,z,0),"hedgehog"));for(a={enable:function(a){return a._ai=setInterval(function(){var b,c,d,e;switch(b=+(n.v.x-a.v.x),d=+(n.v.y-a.v.y),d>b?(c="x",n.v.x>a.v.x?e="right":n.v.x<a.v.x?e="left":n.v.x===a.v.x&&(n.v.y>a.v.y?a.move(new g(0,0,180)):n.v.y<a.v.y&&a.move(new g(0,0,0)),console.log("Catch you on x axis"))):(c="y",n.v.y>a.v.y?e="down":n.v.y<a.v.y?e="up":n.v.y===a.v.y&&(n.v.x>a.v.x?a.move(new g(0,0,90)):n.v.x<a.v.x&&a.move(new g(0,0,270)),console.log("Catch you on y axis!"))),e){case"up":return a.move(new g(0,-1,0));case"right":return a.move(new g(1,0,90));case"down":return a.move(new g(0,1,180));case"left":return a.move(new g(-1,0,270))}},500)},disable:function(a){return clearInterval(a._ai)}},n=new e(new g(Math.randomInt(0,r-1),Math.randomInt(0,r-1),0),"player",3),n.enableControl(),h.push(n),m=v=0;9>=v;m=++v)i=new c(new g(Math.randomInt(0,r-1),Math.randomInt(0,r-1),0),"bot",1),a.enable(i),h.push(i);setInterval(function(){return p()},16)}).call(this);