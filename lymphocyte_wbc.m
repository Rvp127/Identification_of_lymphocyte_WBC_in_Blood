clc;
close all;
clear all;
I=imread('val_34.jpg');
size(I)
figure
imshow(I)
title('original image');
 
rgb = imopen(I,strel('disk',1));
%figure;
%imshow(rgb);
%title('Reconstructed image');

%gray_image = rgb2gray(rgb);
%figure;
%imshow(gray_image);
% title('grey image')

%[centers, radii] = imfindcircles(rgb,[2 80],'ObjectPolarity','dark','Sensitivity',0.9);
%figure;
%imshow(rgb);
%title('circled image');

%cell = length(centers);
%h = viscircles(centers,radii);

red=rgb(:,:,1);
green= rgb(:,:,2);
blue= rgb(:,:,3);

%thresholdtest
%out=red>25 & red<199 &green<130 & blue>140 & blue<225;
out=red>25 & red<199 &green<130 & blue>120 & blue<225;
%figure;
%imshow(out);
%title('greyscale image')

out1=imfill(out,'holes');
%figure;
%imshow(out1);
%title('Hole filling')

out2=bwmorph(out1,'erode');
 %figure;
 %imshow(out2);
 %title('Eroded image');

out3=bwmorph(out2,'dilate',1.2);
%figure;
%imshow(out3);
%title('Dilated image');

out3=imfill(out3,'holes');
%figure;
%imshow(out3);
%title("dilated holes filling");

out3=bwareaopen(out3,300);
%figure;
%imshow(out3);
%title('erode-dilated image')

[centers1, radii1] = imfindcircles(out3,[20 80],'ObjectPolarity','bright','Sensitivity',0.764);
figure;
imshow(out3);
title('Circled objects')

cell1 = length(centers1);
h1 = viscircles(centers1,radii1);

%figure;
%imshow(out3);
%title('final image')
%[l,NUM]=bwlabel(out3,4);
 
