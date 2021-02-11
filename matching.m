function [digit] = matching(X)

%%

%%test of numbers
t0 = double(magnitudeMatrix('char/0.bmp'));
t1 = double(magnitudeMatrix('char/1.bmp'));
t2 = double(im2bw(magnitudeMatrix('char/2.bmp')));
t3 = double(magnitudeMatrix('char/3.bmp'));
t4 = double(magnitudeMatrix('char/4.bmp'));
t5 = double(magnitudeMatrix('char/5.bmp'));
t6 = double(magnitudeMatrix('char/6.bmp'));
t7 = double(magnitudeMatrix('char/7.bmp'));
t8 = double(magnitudeMatrix('char/8.bmp'));
t9 = double(magnitudeMatrix('char/9.bmp'));

%%test of letters
ta = double(magnitudeMatrix('char/A.bmp'));
tb = double(magnitudeMatrix('char/B.bmp'));
tc = double(magnitudeMatrix('char/C.bmp'));
td = double(im2bw(magnitudeMatrix('char/D.bmp')));
te = double(magnitudeMatrix('char/E.bmp'));
tf = double(magnitudeMatrix('char/F.bmp'));
tg = double(magnitudeMatrix('char/G.bmp'));
th = double(magnitudeMatrix('char/H.bmp'));
ti = double(magnitudeMatrix('char/I.bmp'));
tj = double(magnitudeMatrix('char/J.bmp'));
tk = double(magnitudeMatrix('char/K.bmp'));
tl = double(magnitudeMatrix('char/L.bmp'));
tm = double(magnitudeMatrix('char/M.bmp'));
tn = double(magnitudeMatrix('char/N.bmp'));
to = double(magnitudeMatrix('char/O.bmp'));
tp = double(magnitudeMatrix('char/P.bmp'));
tr = double(magnitudeMatrix('char/R.bmp'));
ts = double(magnitudeMatrix('char/S.bmp'));
tt = double(magnitudeMatrix('char/T.bmp'));
tu = double(magnitudeMatrix('char/U.bmp'));
tv = double(magnitudeMatrix('char/V.bmp'));
ty = double(magnitudeMatrix('char/Y.bmp'));
tz = double(magnitudeMatrix('char/Z.bmp'));

letter = [ta; tb; tc; td; te; tf; tg; th; ti; tj; tk; tl; tm; tn; to; tp; tr; ts; tt; tu; tv; ty; tz];
number = [t0; t1; t2; t3; t4; t5; t6; t7; t8; t9];

character=[letter; number];

%%

X = double(X);
D = zeros(33,2);

for n=1:size(character,1)
    D(n) = acos(((X)*((character(n,:))'))/((X*(X'))*(character(n,:)*(character(n,:)'))));
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
     digit = 'O';
 elseif row_argmin == [16,1]
     digit = 'P';
 elseif row_argmin == [17,1]
     digit = 'R';
 elseif row_argmin == [18,1]
     digit = 'S';
 elseif row_argmin == [19,1]
     digit = 'T';
 elseif row_argmin == [20,1]
     digit = 'U';
 elseif row_argmin == [21,1]
     digit = 'V'; 
 elseif row_argmin == [22,1]
     digit = 'Y';
 elseif row_argmin == [23,1]
     digit = 'Z';
 elseif row_argmin == [24,1]
     digit = '0';
 elseif row_argmin == [25,1]
     digit = '1';
 elseif row_argmin == [26,1]
     digit = '2';
 elseif row_argmin == [27,1]
     digit = '3';
 elseif row_argmin == [28,1]
     digit = '4';
 elseif row_argmin == [29,1]
     digit = '5';
 elseif row_argmin == [30,1]
     digit = '6';
 elseif row_argmin == [31,1]
     digit = '7';
 elseif row_argmin == [32,1]
     digit = '8';
 else 
     digit = '9';
 end
 
 disp(digit)
