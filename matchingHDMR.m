function [digit] = matchingHDMR(X)

%%

%%test of numbers
t0 = hdmr(two2three('char/0.bmp'));
t0_2 = hdmr(two2three('char/0_2.bmp'));
t0_3 = hdmr(two2three('char/0_3.bmp'));
t1 = hdmr(two2three('char/1.bmp'));
t1_2 = hdmr(two2three('char/1_2.bmp'));
t2 = hdmr(two2three('char/2.bmp'));
t2_2 = hdmr(two2three('char/2_2.bmp'));
t2_3 = hdmr(two2three('char/2_3.bmp'));
t2_4 = hdmr(two2three('char/2_4.bmp'));
t3 = hdmr(two2three('char/3.bmp'));
t4 = hdmr(two2three('char/4.bmp'));
t4_2 = hdmr(two2three('char/4_2.bmp'));
t4_3 = hdmr(two2three('char/4_3.bmp'));
t5 = hdmr(two2three('char/5.bmp'));
t5_2 = hdmr(two2three('char/5_2.bmp'));
t6 = hdmr(two2three('char/6.bmp'));
t6_2 = hdmr(two2three('char/6_2.bmp'));
t6_3 = hdmr(two2three('char/6_3.bmp'));
t7 = hdmr(two2three('char/7.bmp'));
t8 = hdmr(two2three('char/8.bmp'));
t8_2 = hdmr(two2three('char/8_2.bmp'));
t8_3 = hdmr(two2three('char/8_3.bmp'));
t9 = hdmr(two2three('char/9.bmp'));
t9_2 = hdmr(two2three('char/9_2.bmp'));
t9_3 = hdmr(two2three('char/9_3.bmp'));
t9_4 = hdmr(two2three('char/9_4.bmp'));


%%test of letters
ta = hdmr(two2three('char/A.bmp'));
tb = hdmr(two2three('char/B.bmp'));
tb_2 = hdmr(two2three('char/B_2.bmp'));
tc = hdmr(two2three('char/C.bmp'));
td = hdmr(two2three('char/D.bmp'));
td_2 = hdmr(two2three('char/D_2.bmp'));
te = hdmr(two2three('char/E.bmp'));
te_2 = hdmr(two2three('char/E_2.bmp'));
tf = hdmr(two2three('char/F.bmp'));
tg = hdmr(two2three('char/G.bmp'));
tg_2 = hdmr(two2three('char/G_2.bmp'));
tg_3 = hdmr(two2three('char/G_3.bmp'));
th = hdmr(two2three('char/H.bmp'));
th_2 = hdmr(two2three('char/H_2.bmp'));
ti = hdmr(two2three('char/I.bmp'));
tj = hdmr(two2three('char/J.bmp'));
tk = hdmr(two2three('char/K.bmp'));
tl = hdmr(two2three('char/L.bmp'));
tm = hdmr(two2three('char/M.bmp'));
tn = hdmr(two2three('char/N.bmp'));
tn_2 = hdmr(two2three('char/N_2.bmp'));
tn_3 = hdmr(two2three('char/N_3.bmp'));
tn_4 = hdmr(two2three('char/N_4.bmp'));
to = hdmr(two2three('char/O.bmp'));
to_2 = hdmr(two2three('char/O_2.bmp'));
tp = hdmr(two2three('char/P.bmp'));
tr = hdmr(two2three('char/R.bmp'));
ts = hdmr(two2three('char/S.bmp'));
tt = hdmr(two2three('char/T.bmp'));
tu = hdmr(two2three('char/U.bmp'));
tu_2 = hdmr(two2three('char/U_2.bmp'));
tv = hdmr(two2three('char/V.bmp'));
ty = hdmr(two2three('char/Y.bmp'));
tz = hdmr(two2three('char/Z.bmp'));

letter = [ta; tb; tc; td; te; tf; tg; th; ti; tj; tk; tl; tm; tn; tn_2; to; tp; tr; ts; tt; tu; tv; ty; tz];
number = [t0; t0_2; t0_3; t1; t2; t3; t4; t4_2; t4_3; t5; t6; t6_2; t7; t8; t9; td_2; t9_3; th_2; t2_2; te_2; t2_3; tn_3; tu_2; t6_3; t8_2; t1_2; t2_4; tg_2; to_2; t5_2; tg_3; tb_2; t8_3; tn_4; t9_4; t9_2];

character=[letter; number];

%%

X = double(X);
D = zeros(60,2);

for n=1:size(character,1)
     D(n)  = sqrt(sum((X - character(n,:)).^ 2));
     %D(n) = acos(((X)*((character(n,:))'))/((X*(X'))*(character(n,:)*(character(n,:)'))));
end

 [ row_min row_argmin ] = min( D, [], 1 );

 
 if row_argmin == [1,1]
     digit = 'A';
 elseif row_argmin == [2,1]
     digit = 'B';
 elseif row_argmin == [3,1]
     digit = 'C';
 elseif row_argmin == [4,1]
     digit = 'D';
 elseif row_argmin == [5,1]
     digit = 'E';
 elseif row_argmin == [6,1]
     digit = 'F';
 elseif row_argmin == [7,1]
     digit = 'G';
 elseif row_argmin == [8,1]
     digit = 'H';
 elseif row_argmin == [9,1]
     digit = 'I';
 elseif row_argmin == [10,1]
     digit = 'J';
 elseif row_argmin == [11,1]
     digit = 'K';
 elseif row_argmin == [12,1]
     digit = 'L';
 elseif row_argmin == [13,1]
     digit = 'M'; 
 elseif row_argmin == [14,1]
     digit = 'N';
 elseif row_argmin == [15,1]
     digit = 'N';
 elseif row_argmin == [16,1]
     digit = 'O';
 elseif row_argmin == [17,1]
     digit = 'P';
 elseif row_argmin == [18,1]
     digit = 'R';
 elseif row_argmin == [19,1]
     digit = 'S';
 elseif row_argmin == [20,1]
     digit = 'T';
 elseif row_argmin == [21,1]
     digit = 'U';
 elseif row_argmin == [22,1]
     digit = 'V'; 
 elseif row_argmin == [23,1]
     digit = 'Y';
 elseif row_argmin == [24,1]
     digit = 'Z';
 elseif row_argmin == [25,1]
     digit = '0'; 
 elseif row_argmin == [26,1]
     digit = '0';
elseif row_argmin == [27,1]
     digit = '0';
 elseif row_argmin == [28,1]
     digit = '1';
 elseif row_argmin == [29,1]
     digit = '2';
 elseif row_argmin == [30,1]
     digit = '3';
 elseif row_argmin == [31,1]  
     digit = '4';
 elseif row_argmin == [32,1]
     digit = '4'; 
 elseif row_argmin == [33,1]
     digit = '4'; 
 elseif row_argmin == [34,1]
     digit = '5';
 elseif row_argmin == [35,1]
     digit = '6';
 elseif row_argmin == [36,1]
     digit = '6';
 elseif row_argmin == [37,1]
     digit = '7';
 elseif row_argmin == [38,1]
     digit = '8';
 elseif row_argmin == [39,1]
     digit = '9';
 elseif row_argmin == [40,1]
     digit = 'D';   
elseif row_argmin == [41,1]
     digit = '9'; 
elseif row_argmin == [42,1]
     digit = 'H'; 
elseif row_argmin == [43,1]
     digit = '2';
elseif row_argmin == [44,1]
     digit = 'E';
elseif row_argmin == [45,1]
     digit = '2';
elseif row_argmin == [46,1]
     digit = 'N';
elseif row_argmin == [47,1]
     digit = 'U';
elseif row_argmin == [48,1]
     digit = '6';
elseif row_argmin == [49,1]
     digit = '8';
elseif row_argmin == [50,1]
     digit = '1';
elseif row_argmin == [51,1]
     digit = '2';
elseif row_argmin == [52,1]
     digit = 'G';
elseif row_argmin == [53,1]
     digit = 'O';
elseif row_argmin == [54,1]
     digit = '5';
elseif row_argmin == [55,1]
     digit = 'G';
elseif row_argmin == [56,1]
     digit = 'B';
elseif row_argmin == [57,1]
     digit = '8';
elseif row_argmin == [58,1]
     digit = 'N';
elseif row_argmin == [59,1]
     digit = '9';
 else
     digit = '9';
 end
 
 
 disp(digit)
