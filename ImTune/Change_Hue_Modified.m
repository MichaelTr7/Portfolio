%Hue Adjustment Function%

function [Hue_Modified_Image] = Change_Hue_Modified(HSI_Array,Angle_Adjustment)
global img;
global HSI_Array;
global Hue_Adjustment_Knob;
global Brightness_Slider;

Hue_Angle_Adjustment = Angle_Adjustment;

fprintf('Processing hue adjustment...\n');

Hue_Component = HSI_Array(:,:,1);
Saturation_Component = HSI_Array(:,:,2);
Intensity_Component = HSI_Array(:,:,3);

[Image_Row_Dimension,Image_Column_Dimension,Height] = size(HSI_Array);
Hue_Adjustment_Matrix = Hue_Angle_Adjustment.*ones(Image_Row_Dimension,Image_Column_Dimension);


Hue_Component = Hue_Component + Hue_Adjustment_Matrix;

%Revolution technique%
for row = 1: +1: Image_Row_Dimension
    for column = 1: +1: Image_Column_Dimension


%If the hue index is higher than 2*pi%
if Hue_Component(row,column) > (2*pi)    
Angle_Remainder = rem(Hue_Component(row,column),2*pi);
Hue_Component(row,column) = Angle_Remainder;
end

if Hue_Component(row,column) < 0 
Hue_Component(row,column) = 2*pi - rem(abs(Hue_Component(row,column)),2*pi);  

end

end    
end

%Combining the image with adjusted component%
HSI_Image = cat(3,Hue_Component,Saturation_Component,Intensity_Component);
[Hue_Modified_Image] = hsi_to_rgb(HSI_Image);    

fprintf('Completed hue adjustment!!!\n');

end





