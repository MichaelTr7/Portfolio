%Exporting hue adjusted image in the figure window%
function [] = Save_Image()

global Brightness_Slider;

Result = getframe(figure(1));
[Image_Array] = frame2im(Result);

Filter = {'*.png'};
[File_Name,Path_Name,Index] = uiputfile(Filter);
if Index == 1
Full_File_Name = fullfile(Path_Name,File_Name);
imwrite(Image_Array, Full_File_Name,'Mode','lossless');
end

end


