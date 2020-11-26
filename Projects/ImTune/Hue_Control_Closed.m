function Hue_Control_Closed(Source,Callback_Data)

global Result;
global Hue_Control_Panel;
global Brightness_Control_Panel;
global Exposure_Control_Panel;
global Analysis_Panel;
global Hue_Flag; 

Hue_Module_Selection = questdlg('Close this application?',...
      'Close Request Function',...
      'Entire Application','Cancel','Cancel'); 
  
switch Hue_Module_Selection 
      case 'Entire Application'
        delete(Result);
        delete(Hue_Control_Panel);
        delete(Brightness_Control_Panel);
        delete(Exposure_Control_Panel);
        delete(Analysis_Panel);
        case 'Cancel' 
        return           
end


