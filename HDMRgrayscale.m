clc;
clear all;


%------------------------------------------------------------------
% Inputs to be changed
%------------------------------------------------------------------

varnum = 3; % number of independent variables 

pic1=imread('lena.png'); % image entry
%pic2(:,:,1)=pic;
%pic2(:,:,2)=pic;
%pic2(:,:,3)=pic;
pic1 = im2double(pic1);

%------------------------------------------------------------------
% Alpha parameters
%------------------------------------------------------------------

dimensions = size(pic1);

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
       f0=f0+alpha(1)*alpha(2)*alpha(3)*pic1(i,j,k);
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
         f11(i)= f11(i)+alpha(2)*alpha(3)*pic1(i,j,k);
       end
     end
      f11(i)= f11(i)-f0;
   end  

   for j = 1 : d(2)
     f12(j)=0;
     for i = 1 : d(1)  
       for k = 1 : d(3)
         f12(j)= f12(j)+alpha(1)*alpha(3)*pic1(i,j,k);
       end
       
     end
     f12(j)= f12(j)-f0;
   end

  for k = 1 : d(3)
     f13(k)=0;
     for i = 1 : d(1)  
       for j = 1 : d(2)
         f13(k)= f13(k)+alpha(1)*alpha(2)*pic1(i,j,k);
       end
       
     end
     f13(k)= f13(k)-f0;
   end

%------------------------------------------------------------------
% Univariate HDMR Component
%------------------------------------------------------------------

   for i = 1 : d(1)  
     for j = 1 : d(2)  
       for k = 1 : d(3)  
        comp_f1(i,j,k)=f11(i)+f12(j)+f13(k); 
       end
     end     
   end
%------------------------------------------------------------------
% Bivariate HDMR Term
%------------------------------------------------------------------

   for i = 1 : d(1)
     for j = 1 : d(2)
        f2_12(i,j)=0;
        for k = 1 : d(3)
          f2_12(i,j)= f2_12(i,j)+alpha(3)*pic1(i,j,k);
        end
        f2_12(i,j)= f2_12(i,j)-f0-f11(i)-f12(j);   
     end
   end

   for i = 1 : d(1)
     for k = 1 : d(3) 
        f2_13(i,k)=0;
       for j = 1 : d(2)
         f2_13(i,k)= f2_13(i,k)+alpha(2)*pic1(i,j,k);
       end
        f2_13(i,k)= f2_13(i,k)-f0-f11(i)-f13(k);   
     end
   end

  for j = 1 : d(2)
       for k = 1 : d(3)
            f2_23(j,k)=0;
          for i = 1 : d(1)  
           f2_23(j,k)= f2_23(j,k)+alpha(1)*pic1(i,j,k);
          end
          f2_23(j,k)= f2_23(j,k)-f0-f12(j)-f13(k); 
       end
   end

%------------------------------------------------------------------
% Bivariate HDMR Component
%------------------------------------------------------------------

   for i = 1 : d(1)  
     for j = 1 : d(2)  
       for k = 1 : d(3)  
        comp_f2(i,j,k)=f2_12(i,j)+f2_13(i,k)+f2_23(j,k); 
       end
     end     
   end

%------------------------------------------------------------------
% Bivariate HDMR APPROXIMANT
%------------------------------------------------------------------
  picbiv(:,:,:)=comp_f2+comp_f1+f0;
  
  imshow(picbiv);
  %imwrite(picyeni,'HDMRlenagray.png');
%------------------------------------------------------------------
% Univariate HDMR APPROXIMANT
%------------------------------------------------------------------

  picuni(:,:,:)=comp_f1+f0;

  imshow(picuni);
  %imwrite(picyeni,'HDMRlenagray.png');
  
%------------------------------------------------------------------
% Constant HDMR APPROXIMANT
%------------------------------------------------------------------

  picconst(:,:,:)=f0;

  imshow(picconst);
  %imwrite(picyeni,'HDMRlenagray.png');








