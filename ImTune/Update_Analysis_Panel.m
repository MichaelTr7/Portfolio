function [] = Update_Analysis_Panel(Brightness_Modified_Image)

global Brightness_Modified_Image;
global Analysis_Panel;
global Histogram_Diagram_Image;
global Intensity_Image_Plot;
global Right_Padding;

Image = Brightness_Modified_Image;
Image = rgb2gray(Image);


MATLAB_Blue = [0, 0.4470, 0.7410];
System_Grey = [0.95 0.95 0.95];
System_Font_Grey = [0.3, 0.3, 0.3];
Rotation_View_Angle = 225;
Top_View_Angle = 45;

Histogram_Diagram_Image.Visible = 'off';
Intensity_Image_Plot.Visible = 'off';

%Plotting histogram of adjusted image%
[Image_Height,Image_Width] = size(Image);
Intensity_Grid = linspace(0,255,256)';
[Count_Array] = imhist(Image);
Count_Array = Count_Array';
% Count_Array = zeros(1,256);
% 
% for Row_Scanner = 1: +1: Image_Height
%    for Column_Scanner = 1: +1: Image_Width 
%     
% Pixel_Intensity = Image(Row_Scanner,Column_Scanner);
% 
% %Increment the count array%
% Count_Array(1,Pixel_Intensity+1) = Count_Array(1,Pixel_Intensity+1) + 1;
% 
%    end 
% end

Count_Array = vertcat(Count_Array',zeros(1,1));
Intensity_Grid = vertcat(Intensity_Grid,zeros(1,1));

fprintf("Histogram Calculation Done\n");


%Creating a histogram plot to be exported as an image% 
Maximum_Count = max(Count_Array,[],'all');
Histogram_Diagram = figure('Visible','off');
hold on 
axis([0 255 0 Maximum_Count+0.10*Maximum_Count]);
% Area_Under_Curve = patch([Intensity_Grid fliplr(Count_Array)], [Count_Array min(ylim)*ones(size(Count_Array))],'c');      
% Area_Under_Curve.FaceColor = [0 0.4 0.7];
Count_Array(end) = NaN;
Colormap = Count_Array;
Histogram_Graph = patch(Intensity_Grid,Count_Array,Colormap,'EdgeColor','interp');
Histogram_Graph.LineWidth = 4;
Histogram_Axis = gca;
Histogram_Axis.Color = 'none';
Histogram_Axis.XColor = MATLAB_Blue;
Histogram_Axis.YColor = MATLAB_Blue;
Histogram_Axis.XLabel.String = "Intensity";
Histogram_Axis.YLabel.String = "Occurences";
Histogram_Axis.FontWeight = 'bold';
Histogram_Axis.Title.String = '\color[rgb]{0, 0.4470, 0.7410} {Histogram Intensity Plot}';
Histogram_Axis.XGrid = 'on';
Histogram_Axis.YGrid = 'on';
Histogram_Diagram_Resolution = 4;
Histogram_Diagram.Position = [0 0 Histogram_Diagram_Resolution*300 Histogram_Diagram_Resolution*220];
Histogram_Axis.FontSize = Histogram_Diagram_Resolution*12;

hold off

Captured_Histogram_Plot = getframe(Histogram_Diagram);
Captured_Histogram_Plot = frame2im(Captured_Histogram_Plot);

Histogram_Diagram_Image.ImageSource = Captured_Histogram_Plot;

%3D plot calculation parameters%
Y_Axis = linspace(1,Image_Height,Image_Height);
X_Axis = linspace(1,Image_Width,Image_Width);
[x,y] = meshgrid(X_Axis,Y_Axis);
Histogram_Diagram_Image.Visible = 'on';

Background_Figure = figure('visible','off');
Background_Figure.Color = System_Grey; 
Intensity_Graph = surf(x,y,Image);
Intensity_Graph.FaceAlpha = 0.5;
Intensity_Graph.EdgeColor = 'none';
Intensity_Plot_Resolution_Factor = 5;
set(Background_Figure,'Position',[0 0 300*Intensity_Plot_Resolution_Factor 220*Intensity_Plot_Resolution_Factor]);

colormap spring;
shading interp;

grid on
Intensity_Grid = gca;
Intensity_Grid.GridColor = MATLAB_Blue;% [R, G, b]
Intensity_Grid.XColor = MATLAB_Blue; % Red
Intensity_Grid.YColor = MATLAB_Blue; % Red
Intensity_Grid.ZColor = MATLAB_Blue; % Red
Intensity_Grid.FontWeight = 'bold';
Intensity_Grid.FontSize = 8*Intensity_Plot_Resolution_Factor;
Intensity_Grid.Color = 'none';
title('3-D Intensity Plot','Color',MATLAB_Blue,'FontSize',12.5*Intensity_Plot_Resolution_Factor);
view(Rotation_View_Angle,Top_View_Angle);

%Capturing then pushing image of 3-D plot to the analysis widget%
Captured_Frame = getframe(Background_Figure);
[Captured_Image_Array] = frame2im(Captured_Frame);
Intensity_Image_Plot.ImageSource = Captured_Image_Array;
Intensity_Image_Plot.Visible = 'on';

end
