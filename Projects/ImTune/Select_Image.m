%Grabbing an image based on file path%
function [HSI_Array,img] = Select_Image(Hue_Adjustment_Element,HSI_Array,img,Hue_Angle_Indicator,Coupled_Element,Hue_Adjustment_Field_Label)

global img;
global HSI_Array;
global Result;
global Notification_Image;
global Hue_Adjustment_Field;
global Brightness_Slider;


%Default image if no image is given%
Default_Image = 'Tesla_Roadster.jpg';

%Opening up window for user to select an image%
[File_Name, Path_Name] = uigetfile({'*.JPG; *.PNG'},'Select File to Open');

%Add path if an image is selected by the user%
if File_Name ~= 0 
Selected_Full_File_Name = fullfile(Path_Name,File_Name);
addpath(Selected_Full_File_Name);

%Reading the image file%
img = imread(Selected_Full_File_Name);


[HSI_Array] = rgb_to_hsi(img);

%Updating the left image when new image is grabbed%
Result = figure(1);
Result.CloseRequestFcn = @Main_Figure_Closed;
subplot(1,2,1); imshow(img);
title('Original Image');
subplot(1,2,2); imshow([]);
title('Enhanced Image'); 
truesize([300 400]);
set(Result,'Resize','off');
[Hue_Angle_Indicator] = Update_Image_Hue(Hue_Adjustment_Element,HSI_Array,img,Hue_Angle_Indicator,Coupled_Element,Hue_Adjustment_Field_Label);

end

end
