function Main_Figure_Closed(Source,Callback_Data)

global Result;
global Hue_Control_Panel;
global Brightness_Control_Panel;
global Exposure_Control_Panel;
global Analysis_Panel;


fprintf("Figure deleted\n");

Close_App_Selection = questdlg('Close the application?','Close Request Function',...
    'Yes','No','No');

switch Close_App_Selection
    case 'Yes'
        delete(Result);
        delete(Hue_Control_Panel);
        delete(Brightness_Control_Panel);
        delete(Exposure_Control_Panel);
        delete(Analysis_Panel);
        
    case 'No'
        return
end

end