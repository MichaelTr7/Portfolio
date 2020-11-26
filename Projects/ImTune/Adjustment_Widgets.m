%Brightness adjustment slider%
function [] = Adjustment_Widgets()

global Result;
global Brightness_Slider;
global Hue_Adjustment_Knob;
global Hue_Modified_Image;
global Brightness_Toggle_Switch;
global Exposure_Slider;
global Exposure_Toggle;

%Global control panels%
global Brightness_Control_Panel;
global Exposure_Control_Panel;
global Analysis_Panel;

MATLAB_Blue = [0, 0.4470, 0.7410];
System_Grey = [0.95 0.95 0.95];
System_Font_Grey = [0.3, 0.3, 0.3];

%*************************************************************************%
%GUI (GRAPHICAL USER INTERFACE) SETUP
%*************************************************************************%

%Control panel/container holding the brightness controls%
Brightness_Control_Panel = uifigure();
Brightness_Control_Panel.Position = [700 100 100 250];
Brightness_Control_Panel.CloseRequestFcn = @Brightness_Control_Closed;
set(Brightness_Control_Panel,'Resize','off');

%Slider to control the brightness value%
Brightness_Slider = uislider(Brightness_Control_Panel);
Brightness_Slider.Position = [30 80 150 1];
Brightness_Slider.Orientation = 'vertical';
Brightness_Slider.Limits = [-255 255];
Brightness_Slider.FontColor = MATLAB_Blue;
Brightness_Slider.FontWeight = 'bold';
Brightness_Slider.BusyAction = 'cancel';


Brightness_Label = uilabel(Brightness_Control_Panel);
Brightness_Label.Text = 'Brightness';
Brightness_Label.Position = [19 0 100 50];
Brightness_Label.FontWeight = 'bold'; 
Brightness_Label.FontColor = MATLAB_Blue;

Brightness_Toggle_Switch = uiswitch(Brightness_Control_Panel);
Brightness_Toggle_Switch.Position = [35 40 30 30];
Brightness_Toggle_Switch.Value = 'On';
Brightness_Toggle_Switch.BusyAction = 'cancel';

Exposure_Control_Panel = uifigure();
Exposure_Control_Panel.Position = [830 100 100 250];
Exposure_Control_Panel.CloseRequestFcn = @Exposure_Control_Closed;
set(Exposure_Control_Panel,'Resize','off');

Exposure_Slider = uislider(Exposure_Control_Panel);
Exposure_Slider.Position = [30 80 150 1];
Exposure_Slider.Orientation = 'vertical';
Exposure_Slider.Limits = [2 10];
Exposure_Slider.FontColor = MATLAB_Blue;
Exposure_Slider.FontWeight = 'bold';
Exposure_Slider.Value = 2;
Exposure_Slider.BusyAction = 'cancel';

Exposure_Label = uilabel(Exposure_Control_Panel);
Exposure_Label.Text = 'Exposure';
Exposure_Label.Position = [24 0 100 50];
Exposure_Label.FontWeight = 'bold'; 
Exposure_Label.FontColor = MATLAB_Blue;

Exposure_Toggle = uiswitch(Exposure_Control_Panel);
Exposure_Toggle.Position = [35 40 30 30];
Exposure_Toggle.Value = 'On';
Exposure_Toggle.BusyAction = 'cancel';

%Callback functions%
Brightness_Slider.ValueChangedFcn = @(Brightness_Slider,event) Brightness_Calculation(Brightness_Slider,Brightness_Toggle_Switch,Hue_Adjustment_Knob,Exposure_Slider,Exposure_Toggle);
Brightness_Toggle_Switch.ValueChangedFcn = @(Brightness_Toggle_Switch,event) Brightness_Calculation(Brightness_Slider,Brightness_Toggle_Switch,Hue_Adjustment_Knob,Exposure_Slider,Exposure_Toggle);
Exposure_Slider.ValueChangedFcn = @(Exposure_Slider,event) Brightness_Calculation(Brightness_Slider,Brightness_Toggle_Switch,Hue_Adjustment_Knob,Exposure_Slider,Exposure_Toggle);
Exposure_Toggle.ValueChangedFcn = @(Exposure_Slider,event) Brightness_Calculation(Brightness_Slider,Brightness_Toggle_Switch,Hue_Adjustment_Knob,Exposure_Slider,Exposure_Toggle);

global Analysis_Panel;
global Histogram_Diagram_Image;
global Intensity_Image_Plot;
global Right_Padding;

MATLAB_Blue = [0, 0.4470, 0.7410];
System_Grey = [0.95 0.95 0.95];
System_Font_Grey = [0.3, 0.3, 0.3];


%Outer container holding the histogram plot%
Analysis_Panel = uifigure('Name','Histogram Analysis Panel','Scrollable','on');
Analysis_Panel.Position = [960 100 358 250];
Analysis_Panel.Resize = 'off';
Analysis_Panel.Color = System_Grey;
Analysis_Panel.CloseRequestFcn = @Analysis_Panel_Closed;


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


end




