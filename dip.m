close all;
clear all;
clc;     %clears command window, previously opened variables and windows
i=imread('/Users/harsha/Desktop/lena512.bmp'); %to read an image and store it in 'i'
figure;imshow(i);
%image padding
[R, C] = size(i);  %matrix to store the size of the image
D = sqrt(R^2 + C^2);   %Diagonal D
RPad = ceil(D - R) + 2; %calculating padding values
CPad = ceil(D - C) + 2;
pad = zeros(R+RPad, C+CPad); %padding matrix
pad(ceil(RPad/2):(ceil(RPad/2)+R-1),ceil(CPad/2):(ceil(CPad/2)+C-1)) = i; %the mid area of the padding matrix is replaced by the image

degree=53; rads=(degree*pi)/180; %converting the angle of rotation from degrees to radians

%midpoints
midx=ceil((size(pad,1)+1)/2);  %calculating midpoints such that the rotation takes place about the midpoints
midy=ceil((size(pad,2)+1)/2);

imagerot=zeros(size(pad));  %creating an empty matrix to store the rotated image

%rotation
for i=1:size(imagerot,1)
    for j=1:size(imagerot,2)

         x= (i-midx)*cos(rads)+(j-midy)*sin(rads); %anti-clockwise rotation
         y=-(i-midx)*sin(rads)+(j-midy)*cos(rads);
         x=round(x)+midx;
         y=round(y)+midy;

         if (x>=1 && y>=1 && x<=size(pad,2) && y<=size(pad,1)) %to ensure positive intensity values
              imagerot(i,j)=pad(x,y); % k degrees rotated image         
         end

    end
end
  figure,imagesc(imagerot);  %to display image with scaled colors
  colormap(gray(256)); %to set the colormap of the given figure to grayscale