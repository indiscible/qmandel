w:1200
h:800
s:w*h

m: ( [] 	  
	 x:s#0f; y:s#0f; n:s#0f; sn:s#0f; c:s#0i; 
	 cx: -2.5f + (3.6%w)*s#til w;
	 cy: -1.2f + (2.4%h)*raze (w#) each til h )

do [50;
	update x:cx+(x*x)-y*y,
	y:cy+2*x*y,
	n:(x*x)+y*y,
	c:c+1,
	sn: sn + exp neg[n]
	from `m where n<4 ]

save `:data/m
\l bmp.q
bmp [ `:red.bmp; "e"$m.c; w,h ]

\\

