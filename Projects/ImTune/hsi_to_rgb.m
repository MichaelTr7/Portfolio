%HSI (Hue,Saturation,Intensity) to RGB Image Conversion Function%

function [RGB_Image] = hsi_to_rgb(HSI_Image)

global img;
global HSI_Array;
global Brightness_Slider;

%Input Image: (double)%
%Output Image: (double)%


%Split the hue, saturation, intensity (HSI) components/arrays%
Hue_Array = HSI_Image(:,:,1);
Saturation_Array = HSI_Image(:,:,2);
Intensity_Array = HSI_Image(:,:,3);

[Image_Row_Dimension,Image_Column_Dimension,Height] = size(HSI_Image);

Number_Of_Pixels = Image_Row_Dimension*Image_Column_Dimension;
Red_Component = zeros(Image_Row_Dimension,Image_Column_Dimension);
Green_Component = zeros(Image_Row_Dimension,Image_Column_Dimension);
Blue_Component = zeros(Image_Row_Dimension,Image_Column_Dimension);

%Bin pixel counters%
Counter_1 = 0; %Bin range: [0,2*pi/3]
Counter_2 = 0; %Bin range: [2*pi/3,4*pi/3]
Counter_3 = 0; %Bin range: [4*pi/3,2*pi]


for row = 1: +1: Image_Row_Dimension
    for column = 1: +1: Image_Column_Dimension

%HSI pixel components
H = Hue_Array(row,column);        
S = Saturation_Array(row,column);
I = Intensity_Array(row,column);

%Hue condition 1: range [0,2*pi/3]
if (isnan(H)) || (H < (2*pi/3))
       
b = (I*(1-S));
r = (I*(1 + ((S*cos(H))/(cos((pi/3)-H))))); 
g = (3*I - (r+b));

Red_Component(row,column) = r;
Blue_Component(row,column) = g;
Green_Component(row,column) = b;

Counter_1 = Counter_1 + 1; %Counts the number of pixels falling into bin 1%

end

%Hue condition 2: range [2*pi/3,4*pi/3]
if ((2*pi/3) <= H) && (H < (4*pi/3))

H_Prime_1 = (H - (2*pi/3));   
r = (I*(1-S));
g = (I*(1 + ((S*cos(H_Prime_1))/(cos((pi/3)-H_Prime_1))))); 
b = (3*I - (r+g));

Red_Component(row,column) = r;
Blue_Component(row,column) = g;
Green_Component(row,column) = b;
    
Counter_2 = Counter_2 + 1; %Counts the number of pixels falling into bin 2%
    
end

%Hue condition 3: range [4*pi/3,2*pi]
if ((4*pi/3) <= H) && (H <= (2*pi))
  
H_Prime_2 = (H - (4*pi/3));   
g = (I*(1-S));
b = (I*(1 + ((S*cos(H_Prime_2))/(cos((pi/3)-H_Prime_2))))); 
r = (3*I - (g+b));  
    
Red_Component(row,column) = r;
Blue_Component(row,column) = g;
Green_Component(row,column) = b;    
    
Counter_3 = Counter_3 + 1; %Counts the number of pixels falling into bin 3% 
    
end


    end 
end 
    
%Checking that all the pixels have been processed in respective bins%
Number_Of_Pixels_Registered = Counter_1 + Counter_2 + Counter_3;
Number_Of_Pixels = Image_Row_Dimension*Image_Column_Dimension;


%RGB filter code to accomadate NaN saturation condition%
for Row_Index = 1: +1: Image_Row_Dimension
for Column_Index = 1: +1: Image_Column_Dimension

if isnan(Red_Component(Row_Index,Column_Index))
 
Red_Component(Row_Index,Column_Index) = 0;
end
    
end 
end


for Row_Index = 1: +1: Image_Row_Dimension
for Column_Index = 1: +1: Image_Column_Dimension
    
if isnan(Green_Component(Row_Index,Column_Index))
Green_Component(Row_Index,Column_Index) = 0;
end
           
end 
end


for Row_Index = 1: +1: Image_Row_Dimension
for Column_Index = 1: +1: Image_Column_Dimension
    
if isnan(Blue_Component(Row_Index,Column_Index))
Blue_Component(Row_Index,Column_Index) = 0;
end    
    
end 
end

RGB_Image = cat(3,Red_Component,Blue_Component,Green_Component);

end
