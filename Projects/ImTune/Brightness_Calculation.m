function [] = Brightness_Calculation(Brightness_Slider,Brightness_Toggle_Switch,Hue_Adjustment_Knob,Exposure_Slider,Exposure_Toggle)

global Hue_Modified_Image;
global Brightness_Slider;
global Brightness_Toggle_Switch;
global Brightness_Modified_Image;
global Hue_Adjustment_Knob;
global Exposure_Slider;
global Exposure_Toggle;
global Result;

global Hue_Flag;
global Brightness_Flag;
global Exposure_Flag;
global Analysis_Flag;

%Applying brightness adjustment%
if Brightness_Flag == 1
if length(Brightness_Toggle_Switch.Value) == 2
if Brightness_Toggle_Switch.Value == 'On'
    
Brightness_Modified_Image = uint8(255.*Hue_Modified_Image);
Brightness_Value = Brightness_Slider.Value;
Brightness_Modified_Image = Brightness_Modified_Image + Brightness_Value;

end
end


if length(Brightness_Toggle_Switch.Value) == 3
if Brightness_Toggle_Switch.Value == 'Off'
    
Brightness_Modified_Image = uint8(255.*Hue_Modified_Image);
Brightness_Value = 1;
Brightness_Modified_Image = Brightness_Modified_Image + Brightness_Value;

end
end
end 

if Brightness_Flag ~= 1
Brightness_Modified_Image = Hue_Modified_Image;
end


%Applying exposure adjustment%
if Exposure_Flag == 1
if length(Exposure_Toggle.Value) == 2 
if Exposure_Toggle.Value == 'On' 
fprintf("TEST\n");
Exposure_Value = log2(Exposure_Slider.Value);
Intermediate_Image = Brightness_Modified_Image.*Exposure_Value;
Brightness_Modified_Image = Intermediate_Image;
end
end

if length(Exposure_Toggle.Value) == 3
if Exposure_Toggle.Value == 'Off' 
Exposure_Value = 1;
Intermediate_Image = Brightness_Modified_Image.*Exposure_Value;
Brightness_Modified_Image = Intermediate_Image;
end
end
end 


Result = figure(1);
Result.CloseRequestFcn = @Main_Figure_Closed;
subplot(1,2,1); title('Original Image');
subplot(1,2,2); imshow((Brightness_Modified_Image));
title('Enhanced Image'); 
fprintf("Brightness Change\n");

if Analysis_Flag == 1
Update_Analysis_Panel(Brightness_Modified_Image);
end

end