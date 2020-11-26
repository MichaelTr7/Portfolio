const fs = require("fs");
const { spawn, exec } = require('child_process');
const {app} = require('electron').remote;

localStorage.setItem("Notification_State",0);

window.onload = function(){

var Local_Resource_Path = Grab_Local_Resource_Path();
var Debug = 0;

if(Debug == 1){
Local_Resource_Path = Local_Resource_Path + "/Icon_Converter";
}

console.log(Local_Resource_Path);
localStorage.setItem("Local_Resource_Token",Local_Resource_Path);

}


function Grab_Image(Image_File_Path){

var Verification_Flag = PNG_Verification(Image_File_Path);

if(String(Verification_Flag) == "true"){
Is_A_PNG_Animation(Image_File_Path);
Copy_Image(Image_File_Path);

}

if(String(Verification_Flag) == "false"){
Not_A_PNG_Animation();
}
}

// Verifying if the image is a PNG
function PNG_Verification(Image_Path){
    let Spliced_Path = Image_Path.split("/");
    let File_Name = String(Spliced_Path[Spliced_Path.length-1]);
    let PNG_Flag = File_Name.endsWith('.png');
  return PNG_Flag;
}

function Is_A_PNG_Animation(Image_File_Path){
  var Drop_Area = document.getElementById("Drop_Zone");
  Drop_Area.style.border = "2px solid rgba(255,255,255,0.8)";
  var Drop_Label = document.getElementById("Drop_Label");
  Drop_Label.style.opacity = "0";
  // Drop_Label.innerHTML = String("");
  Preview = document.getElementById("Preview_Image");
  var URL_Template = "url('Link')";
  URL_Template = URL_Template.replace("Link",Image_File_Path);
  Preview.style.backgroundImage = URL_Template;
  var Conversion_Label = document.getElementById("Converting_Label");
  Conversion_Label.classList.remove("Fade_In_Animation")
  void Conversion_Label.offsetWidth;
  Conversion_Label.classList.add("Fade_In_Animation")
  Converting_Label.style.opacity = 1;
  var Notification_Value = localStorage.getItem("Notification_State");
  if(parseInt(Notification_Value) ==  1){
    Notification_Shade.classList.remove("Bounce_Down_Animation");
    Notification_Shade.classList.remove("Bounce_Up_Animation");
    void Notification_Shade.offsetWidth;
    Notification_Shade.classList.add("Bounce_Down_Animation");
    Notification_Shade.style.top = "330px";
    localStorage.setItem("Notification_State",0);
  }
  var Overlay = document.getElementById("Closed_Overlay");
  Overlay.style.visibility = "visible";
}

function Not_A_PNG_Animation(){

var Drop_Area = document.getElementById("Drop_Zone");
Drop_Area.style.border = "2px solid rgba(255,255,255,0)";
Notification_Shade = document.getElementById("Notification_Panel");
Notification_Shade.classList.remove("Bounce_Up_Animation");
Notification_Shade.classList.remove("Bounce_Down_Animation");
void Notification_Shade.offsetWidth;
Notification_Shade.classList.add("Bounce_Up_Animation");
Notification_Shade.style.top = "260px";
localStorage.setItem("Notification_State",1);
}

function Drag_Enter_Animation(){
  var Drop_Area = document.getElementById("Drop_Zone");
  Drop_Area.style.border = "2px solid rgba(255,255,255,0.8)";

}

function Drag_Leave_Animation(){
  var Drop_Area = document.getElementById("Drop_Zone");
  var Drop_Area = document.getElementById("Drop_Zone");
  Drop_Area.style.border = "2px solid rgba(255,255,255,0)";
}

function Conversion(){
console.log("Converting the image");
let App_Path = app.getAppPath("userData");

//

App_Path = localStorage.getItem("Local_Resource_Token");

//

let Model_Path = App_Path + "/View/Controller/Model";
let MacOS_Conversion = App_Path + "/View/Controller/Model/MacOS_Convert_Icon.sh";
var Path = "/Users/michael/Desktop/Icon_Converter/View/Controller/Model";
Execution_Command = MacOS_Conversion + " " + Model_Path;
// console.log(Execution_Command);
console.log(App_Path);

// Execution_Command = "/Applications/Icon Generator.app/Contents/View/Controller/Model/MacOS"
// Test line:
// Execution_Command = Test_String;
// exec('"/Applications/Icon Generator.app/Contents/View/Controller/Model/MacOS_Convert_Icon.sh" /Applications/Icon Generator.app/Contents/View/Controller/Model');

exec(Execution_Command,Completed_MacOS_Conversion);

}

function Completed_MacOS_Conversion(){
  let App_Path = app.getAppPath("userData");

  //

  App_Path = localStorage.getItem("Local_Resource_Token");

  //

  let Model_Path = App_Path + "/View/Controller/Model";
  let MacOS_Conversion = App_Path + "/View/Controller/Model/Windows_Convert_Icon.sh";
  Execution_Command = MacOS_Conversion + " " + Model_Path;
  console.log(Execution_Command);


  let Windows_Icon_Image_Path = Model_Path + "/App_Icon_Image_Resized.png";
  let Windows_Icon_Path = Model_Path + "/Windows_Icon.ico";

  // Test paths
  // Windows_Icon_Image_Path = "View/Controller/Model/App_Icon_Image_Resized.png";
  // Windows_Icon_Path = "View/Controller/Model/Windows_Icon.ico";
  // Execution_Command = 'View/Controller/Model/Windows_Convert_Icon.sh /Users/michael/Desktop/Icon_Converter/View/Controller/Model';

  if(fs.existsSync(Windows_Icon_Image_Path)) {
  fs.unlinkSync(Windows_Icon_Image_Path);
  }

if (fs.existsSync(Windows_Icon_Path)) {
  fs.unlinkSync(Windows_Icon_Path);
  }

exec(Execution_Command,Completed_Conversion);

}

function Completed_Conversion(){

let App_Path = app.getAppPath("userData");

//

App_Path = localStorage.getItem("Local_Resource_Token");

//


console.log(App_Path);
var Result_Panel_Path = App_Path + "/View/Results_Page.html"



// Test line
// Result_Panel_Path = './View/Results_Page.html';

var Results_Panel = document.getElementById('Result_Panel');
Results_Panel.classList.remove("Drop_Results_Animation");
Results_Panel.classList.remove("Push_Results_Animation");
void Results_Panel.offsetWidth;
Results_Panel.classList.add("Push_Results_Animation")
Results_Panel.style.top = "60px";

setTimeout(function(){Drop_New_Icon();},1000);
localStorage.setItem("Results_Panel_Flag",1);

}

function Copy_Image(Image_File_Path){
  let App_Path = app.getAppPath();


  //

  App_Path = localStorage.getItem("Local_Resource_Token");

  //

  console.log(App_Path);
  let Model_Path = App_Path + "/View/Controller/Model";
  let Image_File_Copy_Path = Model_Path + "/App_Icon_Image.png";

// Test line:
// Image_File_Copy_Path = "./View/Controller/Model/App_Icon_Image.png";

fs.copyFile(Image_File_Path, Image_File_Copy_Path, (err) => {

  if (err) throw err;
  console.log("Done");
  Conversion();
  });

  // var filePath = '/Users/michael/Desktop/Icon_Converter/View/Controller/Model/App_Icon_Image.icns';
  // fs.unlinkSync(filePath);
}

function Drop_New_Icon(){
  let App_Path = app.getAppPath("userData");

  //

  App_Path = localStorage.getItem("Local_Resource_Token");

  //

  let Model_Path = App_Path + "/View/Controller/Model";
  let Image_File_Copy_Path = Model_Path + "/Empty.png";

  Image_File_Copy_Path = "/Users/michael/Desktop/Icon_Converter/View/Controller/Model/Empty.png";
  var URL_Template = "url('Link')";
  URL_Template = URL_Template.replace("Link",Image_File_Copy_Path);

  var Preview = document.getElementById('Preview_Image');
  Preview.style.backgroundImage = URL_Template;

  var Conversion = document.getElementById('Converting_Label');
  Conversion.style.opacity = "0";

  var Drag_And_Drop_Label = document.getElementById('Drop_Label');
  Drop_Label.style.opacity = "1";

  var Drop_Zone = document.getElementById('Drop_Zone');
  Drop_Zone.style.borderColor = "rgba(0,0,0,0)";

}


function MacOS_Selected(){
console.log("MacOS selected");

var MacOS_Selector = document.getElementById('MacOS_Icon');
MacOS_Selector.classList.remove("Spin_Animation");
void MacOS_Selector.offsetWidth;
MacOS_Selector.classList.add("Spin_Animation");
// MacOS_Selector.style.transform = "rotate3d(0,1,0,360deg)";

let App_Path = app.getAppPath("userData");

//

App_Path = localStorage.getItem("Local_Resource_Token");

//

let Model_Path = App_Path + "/View/Controller/Model";
let MacOS_Shell_Command = App_Path + "/View/Controller/Model/Copy_File.sh";

let Icon_Path = Model_Path + "/MacOS_Icon.icns";
let Desktop_Path = app.getPath("desktop") + "/MacOS_Icon.icns";
let Execution_Command = MacOS_Shell_Command + " " + Model_Path + " " + Desktop_Path + " " + Icon_Path;
console.log(Execution_Command);
exec(Execution_Command,() => {console.log("Completed");
var Exported_Alert = document.getElementById("Exported_Notification");
Exported_Alert.innerHTML = "Exported Icon to Desktop";

});

}

function Windows_Selected(){
console.log("Windows selected");

var Windows_Selector = document.getElementById('Windows_Icon');
Windows_Selector.classList.remove("Bounce_Animation");
void Windows_Selector.offsetWidth;
Windows_Selector.classList.add("Bounce_Animation");
// Windows_Selector.style.transform = "rotate3d(0,1,0,360deg)";

let App_Path = app.getAppPath("userData");

//

App_Path = localStorage.getItem("Local_Resource_Token");

//

let Model_Path = App_Path + "/View/Controller/Model";
let Windows_Shell_Command = App_Path + "/View/Controller/Model/Copy_File.sh";

let Icon_Path = Model_Path + "/MacOS_Icon.icns";
let Desktop_Path = app.getPath("desktop") + "/Windows_Icon.ico";
let Execution_Command = Windows_Shell_Command + " " + Model_Path + " " + Desktop_Path + " " + Icon_Path;
console.log(Execution_Command);
exec(Execution_Command,() => {console.log("Completed");
var Exported_Alert = document.getElementById("Exported_Notification");
Exported_Alert.innerHTML = "Exported Icon to Desktop";

});
}

function Grab_Local_Resource_Path(){

  var Path_Name = String(window.location);
  Path_Name = String(Path_Name.replace("Main_Panel.html",""));
  Path_Name = String(Path_Name.replace("file://",""));
  Path_Name = String(decodeURI(Path_Name));
  // Path_Name = "/Users/michael/Desktop/GPA Grapher.app/Contents/Resources/app/"
  // Path_Name = String(Path_Name) + 'Course_Bank.json';
  localStorage.setItem('Path_Prefix',Path_Name);


  var App_Root_Path = Path_Name;
  var Partitioned_Path = App_Root_Path.split("/");
  // console.log(Partitioned_Path);
  var Path_To_Local_Resource =  "/" + String(Partitioned_Path[1]) + "/" + String(Partitioned_Path[2]) + "/" + String(Partitioned_Path[3]);

//Beta testing line
  // var Path_To_Profile_Data = Path_Name;

return Path_To_Local_Resource;
}
