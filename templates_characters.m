
%%test of numbers
t0 = double(magnitudeMatrix('char/0.bmp'));
t1 = double(magnitudeMatrix('char/1.bmp'));
t2 = double(im2bw(magnitudeMatrix('char/2.bmp')));
t3 = double(magnitudeMatrix('char/3.bmp'));
t4 = double(magnitudeMatrix('char/4.bmp'));
t5 = double(magnitudeMatrix('char/4.bmp'));
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

save('testset')


% 
% NewTemplates=mat2cell(character, [1], [1008 1008 1008 1008 1008 1008 1008 1008 ...
%      1008 1008 1008 1008 1008 1008 1008 ...
%      1008 1008 1008 1008 1008 1008 1008 ...
%      1008 1008 1008 1008 1008 1008 1008 ...
%      1008 1008 1008 1008]);
%  

