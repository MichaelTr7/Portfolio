MATLAB_Blue = [0, 0.4470, 0.7410];
System_Grey = [0.95 0.95 0.95];
System_Font_Grey = [0.3, 0.3, 0.3];


%Plotting histogram of adjusted image%
Image = imread('Pikachu.jpg');
Image = rgb2gray(Image);
[Image_Height,Image_Width] = size(Image);
Intensity_Grid = linspace(0,255,256)';
Count_Array = zeros(1,256);

for Row_Scanner = 1: +1: Image_Height
   for Column_Scanner = 1: +1: Image_Width 
    
Pixel_Intensity = Image(Row_Scanner,Column_Scanner);

%Increment the count array%
Count_Array(1,Pixel_Intensity+1) = Count_Array(1,Pixel_Intensity+1) + 1;

   end 
end

Count_Array = vertcat(Count_Array',zeros(1,1));
Intensity_Grid = vertcat(Intensity_Grid,zeros(1,1));

%Creating a histogram plot to be exported as an image% 
Maximum_Count = max(Count_Array,[],'all');
Histogram_Diagram = figure();
hold on 
axis([0 255 0 Maximum_Count+0.10*Maximum_Count]);
% Area_Under_Curve = patch([Intensity_Grid fliplr(Count_Array)], [Count_Array min(ylim)*ones(size(Count_Array))],'c');      
% Area_Under_Curve.FaceColor = [0 0.4 0.7];
Count_Array(end) = NaN;
Colormap = Count_Array;
Histogram_Graph = patch(Intensity_Grid,Count_Array,Colormap,'EdgeColor','interp');
Histogram_Graph.LineWidth = 1;
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
Histogram_Diagram.Position = [0 0 300 220];
Histogram_Axis.FontSize = 12;
hold off

Captured_Histogram_Plot = getframe(Histogram_Diagram);
Captured_Histogram_Plot = frame2im(Captured_Histogram_Plot);


imshow(Captured_Histogram_Plot);


