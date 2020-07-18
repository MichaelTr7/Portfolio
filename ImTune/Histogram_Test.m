global Analysis_Panel;
global Histogram_Diagram_Image;
global Intensity_Image_Plot;
global Right_Padding;

MATLAB_Blue = [0, 0.4470, 0.7410];
System_Grey = [0.95 0.95 0.95];
System_Font_Grey = [0.3, 0.3, 0.3];


%Outer container holding the histogram plot%
Analysis_Panel = uifigure('Name','Histogram Analysis Panel','Scrollable','on');
Analysis_Panel.Position = [940 100 358 250];
Analysis_Panel.Resize = 'off';
Analysis_Panel.Color = System_Grey;

%Histogram diagram attributes\parameters%
% Histogram_Diagram = uiaxes(Analysis_Panel);
% Histogram_Diagram.Position = [30 20 300 220];
% Histogram_Diagram.XColor = MATLAB_Blue;
% Histogram_Diagram.YColor = MATLAB_Blue;
% Histogram_Diagram.Title.String = '\color[rgb]{0, 0.4470, 0.7410} {Histogram}';
% Histogram_Diagram.XLabel.String = 'Intensity';
% Histogram_Diagram.YLabel.String = 'Occurences';
% Histogram_Diagram.FontWeight = 'bold';
% Histogram_Diagram.XTick = 0:50:255;
% Histogram_Diagram.XLim = [0 255];
% Histogram_Diagram.XGrid = 'on';
% Histogram_Diagram.YGrid = 'on';
% Histogram_Diagram.AmbientLightColor = [0 0.5 0.5];
% Histogram_Diagram.Color = 'none';
% Histogram_Diagram.Toolbar.Visible = 'off';
% disableDefaultInteractivity(Histogram_Diagram);

%Histogram diagram attributes\parameters%
Histogram_Diagram_Image = uiimage(Analysis_Panel);
Histogram_Diagram_Image.Position = [30 20 300 220];
Histogram_Diagram_Image.Visible = 'off';


%UIimage: object for plotting the 3-D intensity plot%
Intensity_Image_Plot = uiimage(Analysis_Panel);
Intensity_Image_Plot.Position = [392 20 300 220];
Intensity_Image_Plot.Visible = 'off';


%Right margin padding array%
Right_Padding = uiaxes(Analysis_Panel);
Right_Padding.Position = [700 20 20 220];
Right_Padding.Visible = 'off';
disableDefaultInteractivity(Right_Padding);

Update_Analysis_Panel();


