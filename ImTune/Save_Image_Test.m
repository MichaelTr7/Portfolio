%Save image test function%
function [] = Save_Image_Test(Brightness_Modified_Image)

global Result;
global Hue_Modified_Image;
global Brightness_Slider;
global Brightness_Modified_Image;

answer = questdlg('How would you like to save the image?', ...
	'Options', ...
	'Comparison Image','Only the Adjusted Image','Cancel','Cancel');

switch answer
    case 'Comparison Image'
        Option = 1;
        Result_Image = getframe(figure(1));
        [Image_Array] = frame2im(Result_Image);
      
    case 'Only the Adjusted Image'
        Option = 2;
        Result = figure(1);
%         Result_Image = subplot(1,2,2);
%         Result_Image = getframe(Result_Image);
%         [Image_Array] = frame2im(Result_Image);       
          Image_Array = Brightness_Modified_Image;
    case 'Cancel'
        Option = 0;
        return
        
end


if Option ~= 0
Filter = {'*.png'};
[File_Name,Path_Name,Index] = uiputfile(Filter);
if Index == 1
Full_File_Name = fullfile(Path_Name,File_Name);
imwrite(Image_Array, Full_File_Name,'Mode','lossless');

end
end


end