function [] = Update_Module_States()

%Control panel flags for disabling functionality when closed%
global Hue_Flag; Hue_Flag = 1; 
global Brightness_Flag; Brightness_Flag = 1;
global Exposure_Flag; Exposure_Flag = 1;
global Analysis_Flag; Analysis_Flag = 1;

Module_Flag = struct('Hue_Control_Flag',Hue_Flag,...
                     'Brightness_Control_Flag',Brightness_Flag,...
                     'Exposure_Control_Flag',Exposure_Flag,...
                     'Analysis_Control_Flag',Analysis_Flag); 

end