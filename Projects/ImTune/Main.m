clear all;
global img;
global HSI_Array;
global Hue_Modified_Image;
global Result;
global Brightness_Sxlider;
global Exposure_Slider;
global Hue_Flag;
global Brightness_Flag;
global Exposure_Flag;
global Analysis_Flag;

Hue_Flag = 1;
Brightness_Flag = 1;
Exposure_Flag = 1;
Analysis_Flag = 1;


img = imread('Tesla_Roadster.jpg');
Adjustment_Widgets();

Hue_Slider(img);

%All other parameters are added on top of hue modified image%
%Copy of write parameter transfer%

