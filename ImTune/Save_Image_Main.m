%Save image main%

%Loading image test main%
Image_1 = imread('Tesla_Roadster.jpg');
Image_2 = imread('Pikachu.jpg');
figure(1)
subplot(1,2,1); imshow(Image_1);
subplot(1,2,2); imshow(Image_2);

%Setting up the gui%
Display = uifigure('Name','Loading Image Test GUI');
Display.Position = [100 100 500 200];

Select_Image_Button = uibutton(Display,'push');
Select_Image_Button.Position = [200 80 100 40];
Select_Image_Button.ButtonPushedFcn = @(Select_Image_Button,event) Save_Image_Test();







