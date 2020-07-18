function Brightness_Control_Closed(Source,Callback_Data)

global Result;
global Hue_Control_Panel;
global Brightness_Control_Panel;
global Exposure_Control_Panel;
global Analysis_Panel;
global Brightness_Flag;
global Brightness_Slider;
global Brightness_Toggle_Switch;
global Hue_Adjustment_Knob;
global Exposure_Slider;
global Exposure_Toggle;



Hue_Module_Selection = questdlg('Close this module or application',...
      'Close Request Function',...
      'Module','Entire Application','Entire Application'); 
  
switch Hue_Module_Selection 
      case 'Entire Application'
        delete(Result);
        delete(Hue_Control_Panel);
        delete(Brightness_Control_Panel);
        delete(Exposure_Control_Panel);
        delete(Analysis_Panel);
      case 'Module'
        delete(Brightness_Control_Panel);
        Brightness_Flag = 0;
        Brightness_Calculation(Brightness_Slider,Brightness_Toggle_Switch,Hue_Adjustment_Knob,Exposure_Slider,Exposure_Toggle)

      otherwise 
        return           
end


