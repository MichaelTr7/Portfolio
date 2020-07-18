%*************************************************************************%
%CALLBACK FUNCTION FOR HUE ADJUSTMENT CONTROL PANEL%
%*************************************************************************%
function [Hue_Angle_Indicator] = Update_Image_Hue(Hue_Adjustment_Element,HSI_Array,img,Hue_Angle_Indicator,Coupled_Element,Hue_Adjustment_Field_Label)
global img;
global HSI_Array;
global Hue_Adjustment_Field;
global Hue_Adjustment_Knob;
global Hue_Modified_Image;
global Result;
global Brightness_Slider;
global Brightness_Toggle_Switch;
global Exposure_Slider;

Current_Angle = round(Hue_Adjustment_Element.Value,2);

if Current_Angle < 0
Remainder = rem(Current_Angle,360);
Complementary_Angle = 360 + Remainder;
Current_Angle = Complementary_Angle;
end


if Coupled_Element == 0
Hue_Adjustment_Field.Value = Current_Angle;
end

if Coupled_Element ~= 0
Coupled_Element.Value = Current_Angle;
end

%Update the angle shown in UIlabel: Hue_Angle_Indicator%
Hue_Angle_Indicator.Text = {['Angle (Positive Convention): ' num2str(Current_Angle) char(0176)]};

%Converting the angle into radians to be used in change hue function%
Angle_In_Radians = ((2*pi)*(Current_Angle/360));

%Changing the hue of the image%
[Hue_Modified_Image] = Change_Hue_Modified(HSI_Array,Angle_In_Radians);


%Updating the result window%
Result = figure(1);
Result.CloseRequestFcn = @Main_Figure_Closed;
subplot(1,2,1); imshow(img,'InitialMagnification','fit'); 
title('Original Image'); 
% subplot(1,2,2); imshow(Hue_Modified_Image,'InitialMagnification','fit'); 
set(Result, 'ToolBar', 'none', 'MenuBar', 'none'); 
% truesize([300 400]);  
set(Result,'Resize','off'); 

%Calling widgets on top of the hue modified image%
Brightness_Calculation(Brightness_Slider,Hue_Modified_Image,Brightness_Toggle_Switch,Exposure_Slider,Exposure_Slider);






end


