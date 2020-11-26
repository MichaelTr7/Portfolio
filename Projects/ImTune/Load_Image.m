%Test reading image from path script%

function [img] = Load_Image(Selected_Image)
global img;
global Brightness_Slider;

%Opening up window for user to select an image%
[File_Name, Path_Name, Index] = uigetfile({'*.JPG; *.PNG'},'Select File to Open');

if(Index == 1)

%Concatenate path and file names%
Selected_Full_File_Name = fullfile(Path_Name,File_Name);
    
%Add path if an image is selected by the user%
addpath(Selected_Full_File_Name);


%Reading the image file%
img = imread(Selected_Full_File_Name);
Selected_Image.ImageSource = img;

end

end

