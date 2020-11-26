%Loading image test main%
close all;

global img;
%Setting up the gui%
Display = uifigure('Name','Loading Image Test GUI');
Display.Position = [100 100 500 500];

Selected_Image = uiimage(Display);
Selected_Image.Position = [100 150 300 300];


Select_Image_Button = uibutton(Display,'push');
Select_Image_Button.Position = [200 80 100 40];
Select_Image_Button.ButtonPushedFcn = @(Select_Image_Button,event) Load_Image(Selected_Image);




% Load_Image()
