function Analysis_Panel_Closed(Source,Callback_Data)

global Result;
global Hue_Control_Panel;
global Brightness_Control_Panel;
global Exposure_Control_Panel;
global Analysis_Panel;
global Analysis_Flag;

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
        delete(Analysis_Panel);
        Analysis_Flag = 0;

      otherwise 
        return           
end


