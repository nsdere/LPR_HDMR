function [Irows] = magnitudeDigit(I)


c1 = transpose(I(:,1));
c2 = transpose(I(:,2));
c3 = transpose(I(:,3));
c4 = transpose(I(:,4));
c5 = transpose(I(:,5));
c6 = transpose(I(:,6));

c7 = transpose(I(:,7));
c8 = transpose(I(:,8));
c9 = transpose(I(:,9));
c10 = transpose(I(:,10));
c11 = transpose(I(:,11));
c12 = transpose(I(:,12));

c13 = transpose(I(:,13));
c14 = transpose(I(:,14));
c15 = transpose(I(:,16));
c16 = transpose(I(:,16));
c17 = transpose(I(:,17));
c18 = transpose(I(:,18));

c19 = transpose(I(:,19));
c20 = transpose(I(:,20));
c21 = transpose(I(:,21));
c22 = transpose(I(:,22));
c23 = transpose(I(:,23));
c24 = transpose(I(:,24));

Irows = [c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24];
