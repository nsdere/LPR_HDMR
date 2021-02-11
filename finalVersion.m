clc
clear all
close all

%% Read Image
Im    = imread(fullfile('testPlates/testPlates70.jpg')); % Read Image
I     = im2double(rgb2gray(Im));        % RGB to Gray
figure();imshow(I)

%% Sobel Masking 
SM    = [-1 0 1;-2 0 2;-1 0 1];         % Sobel Vertical Mask
IS    = imfilter(I,SM,'replicate');     % Filter Image Using Sobel Mask
IS    = IS.^2;                          % Consider Just Value of Edges 
figure();imshow(IS)

%% Normalization
IS    = (IS-min(IS(:)))/(max(IS(:))-min(IS(:))); % Normalization
figure();imshow(IS)

%% Threshold (Otsu)
level = graythresh(IS);                 % Threshold Based on Otsu Method
IS    = im2bw(IS,level);
figure();imshow(IS)

%% Histogram
S     = sum(IS,2);                      % Edge Horizontal Histogram
figure();plot(1:size(S,1),S)
view(90,90)

%% Plate Location
T1    = 0.35;                           % Threshold On Edge Histogram
PR    = find(S > (T1*max(S)));          % Candidate Plate Rows

Msk   = zeros(size(I));
Msk(PR,:) = 1;                          % Mask
MB    = Msk.*IS;                        % Candidate Plate (Edge Image)
figure();imshow(MB)

%% Morphology (Dilation - Vertical)
Dy    = strel('rectangle',[80,4]);      % Vertical Extension
MBy   = imdilate(MB,Dy);                % By Dilation
MBy   = imfill(MBy,'holes');            % Fill Holes


%% Morphology (Dilation - Horizontal)
Dx    = strel('rectangle',[4,80]);      % Horizontal Extension
MBx   = imdilate(MB,Dx);                % By Dilation
MBx   = imfill(MBx,'holes');            % Fill Holes
figure();imshow(MBy)

%% Joint Places
BIM   = MBx.*MBy;                       % Joint Places
figure();imshow(BIM)

%% Morphology (Dilation - Horizontal)
Dy    = strel('rectangle',[4,30]);      % Horizontal Extension
MM    = imdilate(BIM,Dy);               % By Dilation
MM    = imfill(MM,'holes');             % Fill Holes
figure();imshow(MM)

%% Erosion
Dr    = strel('line',50,0);             % Erosion
BL    = imerode(MM,Dr);
figure();imshow(BL)

%% Find Biggest Binary Region (As a Plate Place)
[L,num] = bwlabel(BL);                  % Label (Binary Regions)               
Areas   = zeros(num,1);
for i = 1:num                           % Compute Area Of Every Region
[r,c,v]  = find(L == i);                % Find Indexes
Areas(i) = sum(v);                      % Compute Area    
end 
[La,Lb] = find(Areas==max(Areas));      % Biggest Binary Region Index
%% Post Processing
[a,b]   = find(L==La);                  % Find Biggest Binary Region (Plate)
[nRow,nCol] = size(I);
FM      = zeros(nRow,nCol);             % Smooth and Enlarge Plate Place
T       = 10;                           % Extend Plate Region By T Pixel
jr      = (min(a)-T :max(a)+T);
jc      = (min(b)-T :max(b)+T);
jr      = jr(jr >= 1 & jr <= nRow);
jc      = jc(jc >= 1 & jc <= nCol);
FM(jr,jc) = 1; 
PL      = FM.*I;                        % Detected Plate
 
 figure();imshow(PL)
 figure();imshow(FM)
%12
%13
%% Plot
imshow(Im); title('Detected Plate')
hold on
rectangle('Position',[min(jc),min(jr),max(jc)-min(jc),...
max(jr)-min(jr)],'LineWidth',4,'EdgeColor','r')
hold off
%% Detect the Plate

plate = imcrop(Im, [min(jc) min(jr) max(jc)-min(jc) max(jr)-min(jr)]);
figure, imshow(plate);


Iplate     = im2double(rgb2gray(plate)); %plate to gray
figure, imshow(Iplate);


%% BLACK WHITE and Save

newPlate2 = segmentImage(Iplate);
imshow(newPlate2)
%16

%% Read Image

imagen = newPlate2;

%% Convert to gray scale
if size(imagen,3)==3 % RGB image
    imagen=rgb2gray(imagen);
end
%% Remove all object containing fewer than 100 pixels
imagen = bwareaopen(imagen,100);
pause(1)
figure, imshow(imagen);

%% Label connected components
[L Ne]=bwlabel(imagen);
%% Measure properties of image regions
propied=regionprops(L,'BoundingBox');
hold on
%% Plot Bounding Box
for n=1:size(propied,1)
rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end
hold off
pause (1)
%% Objects extraction

for n=1:Ne
    [r,c] = find(L==n);
    n1=imagen(min(r):max(r),min(c):max(c));
    pause(0.5)
end

c = cell2mat(struct2cell(propied));

%%Setting variables from segmented digits
%%Eger segmented karakterler 6 adet ise 
if Ne == 6
digit1 = imcrop(imagen,[c(1) c(2) c(3) c(4)]); 
digit1 = imresize(digit1, [42,24]);
matchedDigit1 = hdmr(two2threeInput(digit1));

digit2 = imcrop(imagen,[c(5) c(6) c(7) c(8)]);
digit2 = imresize(digit2, [42,24]);
matchedDigit2 = hdmr(two2threeInput(digit2));


digit3 = imcrop(imagen,[c(9) c(10) c(11) c(12)]);
digit3 = imresize(digit3, [42,24]);
matchedDigit3 = hdmr(two2threeInput(digit3));

digit4 = imcrop(imagen,[c(13) c(14) c(15) c(16)]);
digit4 = imresize(digit4, [42,24]);
matchedDigit4 = hdmr(two2threeInput(digit4));


digit5 = imcrop(imagen,[c(17) c(18) c(19) c(20)]);
digit5 = imresize(digit5, [42,24]);
matchedDigit5 = hdmr(two2threeInput(digit5));


digit6 = imcrop(imagen,[c(21) c(22) c(23) c(24)]);
digit6 = imresize(digit6, [42,24]);
matchedDigit6 = hdmr(two2threeInput(digit6));

digitSet = [matchedDigit1; matchedDigit2; matchedDigit3; matchedDigit4; matchedDigit5; matchedDigit6];

resultSet = zeros(1,6);
for i=1:6
    resultSet(i) = matchingHDMR(digitSet(i,:));
end
%%Eger segmented karakterler 7 adet ise 
elseif Ne == 7

digit1 = imcrop(imagen,[c(1) c(2) c(3) c(4)]); 
digit1 = imresize(digit1, [42,24]);
matchedDigit1 = hdmr(two2threeInput(digit1));

digit2 = imcrop(imagen,[c(5) c(6) c(7) c(8)]);
digit2 = imresize(digit2, [42,24]);
matchedDigit2 = hdmr(two2threeInput(digit2));


digit3 = imcrop(imagen,[c(9) c(10) c(11) c(12)]);
digit3 = imresize(digit3, [42,24]);
matchedDigit3 = hdmr(two2threeInput(digit3));

digit4 = imcrop(imagen,[c(13) c(14) c(15) c(16)]);
digit4 = imresize(digit4, [42,24]);
matchedDigit4 = hdmr(two2threeInput(digit4));


digit5 = imcrop(imagen,[c(17) c(18) c(19) c(20)]);
digit5 = imresize(digit5, [42,24]);
matchedDigit5 = hdmr(two2threeInput(digit5));


digit6 = imcrop(imagen,[c(21) c(22) c(23) c(24)]);
digit6 = imresize(digit6, [42,24]);
matchedDigit6 = hdmr(two2threeInput(digit6));    
    
    
digit7 = imcrop(imagen,[c(25) c(26) c(27) c(28)]);
digit7 = imresize(digit7, [42,24]);
matchedDigit7 = hdmr(two2threeInput(digit7));

digitSet = [matchedDigit1; matchedDigit2; matchedDigit3; matchedDigit4; matchedDigit5; matchedDigit6; matchedDigit7];

resultSet = zeros(1,7);
for i=1:7
    resultSet(i) = matchingHDMR(digitSet(i,:));
end
%%Eger segmented karakterler 8 adet ise 
else if Ne == 8

digit1 = imcrop(imagen,[c(1) c(2) c(3) c(4)]); 
digit1 = imresize(digit1, [42,24]);
matchedDigit1 = hdmr(two2threeInput(digit1));

digit2 = imcrop(imagen,[c(5) c(6) c(7) c(8)]);
digit2 = imresize(digit2, [42,24]);
matchedDigit2 = hdmr(two2threeInput(digit2));


digit3 = imcrop(imagen,[c(9) c(10) c(11) c(12)]);
digit3 = imresize(digit3, [42,24]);
matchedDigit3 = hdmr(two2threeInput(digit3));

digit4 = imcrop(imagen,[c(13) c(14) c(15) c(16)]);
digit4 = imresize(digit4, [42,24]);
matchedDigit4 = hdmr(two2threeInput(digit4));


digit5 = imcrop(imagen,[c(17) c(18) c(19) c(20)]);
digit5 = imresize(digit5, [42,24]);
matchedDigit5 = hdmr(two2threeInput(digit5));


digit6 = imcrop(imagen,[c(21) c(22) c(23) c(24)]);
digit6 = imresize(digit6, [42,24]);
matchedDigit6 = hdmr(two2threeInput(digit6));    
    
    
digit7 = imcrop(imagen,[c(25) c(26) c(27) c(28)]);
digit7 = imresize(digit7, [42,24]);
matchedDigit7 = hdmr(two2threeInput(digit7));    
    
    
digit8 = imcrop(imagen,[c(29) c(30) c(31) c(32)]);
digit8 = imresize(digit8, [42,24]);
matchedDigit8 = hdmr(two2threeInput(digit8));

digitSet = [matchedDigit1; matchedDigit2; matchedDigit3; matchedDigit4; 
    matchedDigit5; matchedDigit6; matchedDigit7; matchedDigit8];

resultSet = zeros(1,8);

for i=1:8
    resultSet(i) = matchingHDMR(digitSet(i,:));
    
end

else 
flag = 1;

    end
end




