# qmandel
mandelbrot in kdb+/q

I started from the mandelbrot one liner at http://www.kparc.com/z/comp.k:

+/4>+/b*b:49{c+(-/x*x;2**/x)}/c:-1.5 -1+(2*!2#w)%w:100

Eventually I figured it out, partially.

But I wanted the mandelbrot where you compute the iterations as well.

So I came up with this:

m: ( [] 	  
	 
	 cx: -2.5f + (3.6%w)*(w*s)#til w;
	 
	 cy: -1.2f + (2.4%h)*raze (w#) each til h;
	 
	 x:s#0f; y:s#0f; n:s#0f; sn:s#0f; c:s#0i )
	

do [50;
	update x:cx+(x*x)-y*y,
	y:cy+2*x*y,
	n:(x*x)+y*y,
	c:c+1
	from `m where n<4 ]

And I wanted a bitmap too:

bmp: { [p; i; s]
 p 1: 0x424d;
 hclose((hopen p)"i"$
  (54+4*(*/)s),0,54,40,s,(1+65536*32),0,0,1,1,0,0) 
   i 
 }
 
bmp [ `:red.bmp; "e"$m.c; s ]

et voila
