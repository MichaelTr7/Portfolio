function Hue_Slider(img)

%Instantiating global variables used across variables%
global img;
global HSI_Array;
global Hue_Adjustment_Field;
global Hue_Adjustment_Knob;
global MATLAB_Blue;
global System_Grey;
global System_Font_Grey;
global Hue_Modified_Image;
global Result;
global Brightness_Slider;
global Hue_Control_Panel;

MATLAB_Blue = [0, 0.4470, 0.7410];
System_Grey = [0.95 0.95 0.95];
System_Font_Grey = [0.3, 0.3, 0.3];

%Setting up the default images%
[HSI_Array] = rgb_to_hsi(img);

%*************************************************************************%
%GRAPHICAL USER INTERFACE COMPONENTS (UI CONTROL PANEL)%
%*************************************************************************%
%Creating UIfigure: hue adjustment control panel%

Hue_Control_Panel = uifigure('Position',[120 100 550 250]);
Hue_Control_Panel.Resize = 'off';
Hue_Control_Panel.Name = 'Hue Control Panel';
Hue_Control_Panel.Color = System_Grey;
Hue_Control_Panel.CloseRequestFcn = @Hue_Control_Closed;

%UIbutton: for exporting images%
Export_Button = uibutton(Hue_Control_Panel,'push');
Export_Button.Position = [450 30 50 50];
Export_Button.BackgroundColor = MATLAB_Blue;
Export_Button.Text = {'Save'; 'Result'};
Export_Button.FontColor = System_Grey;
Export_Button.FontWeight = 'bold';
Export_Button.FontSize = 10;

%Title for the uifigure: Hue_Control_Panel%
Title = uilabel(Hue_Control_Panel);
Title.Position = [30 170 500 100];
Title.Text = 'Image Processing: Hue Adjustment Module';
Title.FontSize = 21;
Title.FontWeight = 'bold';
Title.FontColor = [0.25 0.25 0.25];

%Display for current angle for hue adjustment%
Hue_Angle_Indicator = uilabel(Hue_Control_Panel);
Hue_Angle_Indicator.Position = [300 150 200 20];
Hue_Angle_Indicator.Text = 'Angle (Positive Convention): ';   
Hue_Angle_Indicator.FontColor = System_Font_Grey;

%UIbutton: for selecting the image to apply the adjustments to%
Select_Button = uibutton(Hue_Control_Panel,'push');
Select_Button.Text = {'Select New'; 'Image'};
Select_Button.Position = [300 30 130 50];
Select_Button.BackgroundColor = MATLAB_Blue;
Select_Button.FontColor = System_Grey;
Select_Button.FontWeight = 'bold';
Select_Button.FontSize = 10;


%UIknob: turn knob to set the hue angle%
Hue_Adjustment_Knob = uiknob(Hue_Control_Panel);
Hue_Adjustment_Knob.Position = [100 70 90 360];
Hue_Adjustment_Knob.Limits = [0 360];
Hue_Adjustment_Knob.FontColor = MATLAB_Blue;
Hue_Adjustment_Knob.FontWeight = 'bold';
Hue_Adjustment_Knob.BusyAction = 'cancel';

%Label for UIknob: Hue_Adjustment_Knob%
Hue_Knob_Label = uilabel(Hue_Control_Panel);
Hue_Knob_Label.Position = [78 20 200 20];
Hue_Knob_Label.Text = 'Angle Adjustment Knob';
Hue_Knob_Label.FontColor = MATLAB_Blue;
Hue_Knob_Label.FontWeight = 'bold';

%UIeditfield: type the value to set the angle%
Hue_Adjustment_Field = uieditfield(Hue_Control_Panel,'numeric');
Hue_Adjustment_Field.Position = [300 100 200 20];
Hue_Adjustment_Field.ValueDisplayFormat = '%.2f';
Hue_Adjustment_Field.FontColor = MATLAB_Blue;
Hue_Adjustment_Field.FontWeight = 'bold';
Hue_Adjustment_Field.BusyAction = 'cancel';


%Label for UIeditfield: Hue_Adjustment_Field%
Hue_Adjustment_Field_Label = uilabel(Hue_Control_Panel);
Hue_Adjustment_Field_Label.Position = [300 120 200 20];
Hue_Adjustment_Field_Label.Text = 'Angle Adjustment Angle Field';
Hue_Adjustment_Field_Label.FontWeight = 'bold';
Hue_Adjustment_Field_Label.FontColor = MATLAB_Blue;

%Callback functions%
Hue_Adjustment_Knob.ValueChangedFcn = @(Hue_Adjustment_Knob,event) Update_Image_Hue(Hue_Adjustment_Knob,HSI_Array,img,Hue_Angle_Indicator,0,Hue_Adjustment_Field);
Hue_Adjustment_Field.ValueChangedFcn = @(Hue_Adjustment_Field,event) Update_Image_Hue(Hue_Adjustment_Field,HSI_Array,img,Hue_Angle_Indicator,Hue_Adjustment_Knob);
Select_Button.ButtonPushedFcn = @(Select_Button,event) Select_Image(Hue_Adjustment_Knob,HSI_Array,img,Hue_Angle_Indicator,0,Hue_Adjustment_Field);
% Export_Button.ButtonPushedFcn = @(Export_Button,event) Save_Image();
Export_Button.ButtonPushedFcn = @(Export_Button,event) Save_Image_Test(Hue_Modified_Image);

%Creating initial image window%
Result = figure(1);
Result.CloseRequestFcn = @Main_Figure_Closed;
Result.Position = [120 400 100 100]; 
subplot(1,2,1); imshow(img); 
title('Original Image'); 


subplot(1,2,2); imshow([]);
truesize([300 400]);
set(Result, 'ToolBar', 'none', 'MenuBar', 'none'); 
set(Result,'color',System_Grey); 
set(Result,'Resize','off');
title('Enhanced Image'); 
Update_Image_Hue(Hue_Adjustment_Field,HSI_Array,img,Hue_Angle_Indicator,Hue_Adjustment_Knob);



end

