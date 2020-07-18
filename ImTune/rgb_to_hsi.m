%RGB Image to HSI (Hue,Saturation,Intensity) Conversion Function%

function [HSI_Array,Hue_Array,Saturation_Array,Intensity_Array] = rgb_to_hsi(img)

global img;
global HSI_Array;
global Brightness_Slider;

%Input Image: (uint8 or double)%
%Output Image: (double)%


Image = im2double(img);
[Image_Row_Dimension,Image_Column_Dimension,Height] = size(Image);
Hue_Array = zeros(Image_Row_Dimension,Image_Column_Dimension);
Saturation_Array = zeros(Image_Row_Dimension,Image_Column_Dimension);
Intensity_Array = zeros(Image_Row_Dimension,Image_Column_Dimension);


Red_Component = Image(:,:,1);
Green_Component = Image(:,:,2);
Blue_Component = Image(:,:,3);


Counter_1 = 0;
Counter_2 = 0;

for row = 1: +1: Image_Row_Dimension
    for column = 1: +1: Image_Column_Dimension
    
r = Red_Component(row,column); 
g = Green_Component(row,column);
b = Blue_Component(row,column);  
   
%Evalauting the hue array%

%Evaluating the angle required for the hue array%
Numerator = 0.5*((r-g) + (r-b));
Denominator = sqrt((r-g)^2 + (r-b)*(g-b));
Angle = acos(Numerator/Denominator);

%Angle saturation condition%
if Angle > 2*pi
    
Angle = 2*pi;    
end    

if isnan(Angle)

Angle = 0;    
      
end


%If the pixel is more green        
if Blue_Component(row,column) <= Green_Component(row,column)
   
Hue_Array(row,column) = Angle;
Counter_1 = Counter_1 + 1;    
end 

 
%If the pixel is more blue 
if Blue_Component(row,column) > Green_Component(row,column)

Hue_Array(row,column) = (2*pi - Angle);   
Counter_2 = Counter_2 + 1;      
end 
 
%Evaluting the saturation array%
%Saturation is the complement of the inverese of the intensity%
c_min = min([r g b]);
Saturation_Array(row,column) = (1 - (3/(r+g+b))*c_min); 



%Evaluating the intensity array%
%Intensity is the average of the three RGB channels%
Intensity_Array(row,column) = ((r+b+g)/3); 

    end
end

% Hue_Array = im2double(Hue_Array);
% Saturation_Array = im2double(Saturation_Array);
% Intensity_Array = im2double(Intensity_Array);


HSI_Array = cat(3,Hue_Array,Saturation_Array,Intensity_Array);
Processed_Pixels = Counter_1 + Counter_2;
Pixel_Total = Image_Row_Dimension*Image_Column_Dimension;

end
