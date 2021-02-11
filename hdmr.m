function [f] = hdmr(X)

% %% 2d to 3d 
% X = imread('char/1.bmp');
% X(:,:,1) = X;
% X(:,:,2) = X;

%%

%------------------------------------------------------------------
% Alpha parameters
%------------------------------------------------------------------

varnum = 3;
dimensions = size(X);

for i = 1 : varnum
  d(i)=dimensions(i);
  alpha(i) = 1/d(i);
end

%------------------------------------------------------------------
% Constant HDMR Term
%------------------------------------------------------------------
 f0=0;

  for i = 1 : d(1)
    for j = 1 : d(2)
        for k = 1 : d(3)
       f0=f0+alpha(1)*alpha(2)*alpha(3)*X(i,j,k);
    end
    end
  end
%------------------------------------------------------------------
% Univarite HDMR Term
%------------------------------------------------------------------
for i = 1 : d(1)
    f11(i)=0; 
     for j = 1 : d(2)
         for k = 1 : d(3)
         f11(i)= f11(i)+alpha(2)*alpha(3)*X(i,j,k);
         end
     end
      f11(i)= f11(i);
end  

%%

for j = 1 : d(2)
    f12(j)=0; 
     for i = 1 : d(1)
         for k = 1 : d(3)
         f12(j)= f12(j)+alpha(1)*alpha(3)*X(i,j,k);
         end
     end
      f12(j)= f12(j);
end  

   
   
   for k = 1 : d(3)
    f13(k)=0; 
     for i = 1 : d(1)
         for j = 1 : d(2)
         f13(k)= f13(k)+alpha(1)*alpha(2)*X(i,j,k);
         end
     end
      f13(k)= f13(k);
   end
   
   
   
   f = [(f11) (f12) (f13)];

