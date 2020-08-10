// Cyan (top-left) tile
const fs = require("fs");
const {remote} = require('electron');
var Profile_Edit_State = 0;

function Edit(){

  var Button_Index = 0;
  var Number_Of_Courses = 120;
  for(Button_Index = 1; Button_Index <= Number_Of_Courses; Button_Index++){

    var Button_ID = "Course_Edit_Button_" + String(Button_Index);
    // console.log(Button_ID);
    var Button_Object = document.getElementById(Button_ID);

  
  }

let Edit_Button = document.getElementById('Edit_Button');
let Name_Label = document.getElementById('Name_Label');
let School_Label = document.getElementById('School_Label');
let Program_Label = document.getElementById('Program_Label');


if(Profile_Edit_State == 0){
  Profile_Edit_State = 1;
  Edit_Button.innerHTML = "done";

  Name_Label.contentEditable = true;
  Name_Label.style.background = "rgba(0,0,0,0.1)";

  School_Label.contentEditable = true;
  School_Label.style.background = "rgba(0,0,0,0.1)";

  Program_Label.contentEditable = true;
  Program_Label.style.background = "rgba(0,0,0,0.1)";


}

else{
  Profile_Edit_State = 0;
  Edit_Button.innerHTML = "✎";

  Name_Label.contentEditable = false;
  Name_Label.style.background = "rgba(240,240,240,0)";
  if(Name_Label.innerText.length == 0){
    Name_Label.innerText = "Nickname";
  }

  School_Label.contentEditable = false;
  School_Label.style.background = "rgba(240,240,240,0)";
  if(School_Label.innerText.length == 0){
    School_Label.innerText = "School Name";
  }


  Program_Label.contentEditable = false;
  Program_Label.style.background = "rgba(240,240,240,0)";
  if(Program_Label.innerText.length == 0){
    Program_Label.innerText = " Major/Program";
  }

Saving_Profile_Data();

}
}

function Key_Pressed(Element,Event){

var Key_Pressed = Event.which;
var Key_Code =  Event.keyCode;


  if (Key_Pressed == 13 && Key_Code == 13) {
    Event.preventDefault();
  }

  var Label_Field = document.getElementById(Element.id);

  var Label_Text = (Label_Field.textContent);
  var Text_Length = Label_Text.length + 1;
  var Label_Field_Max = Element.getAttribute("max");

  if(Text_Length >= Label_Field_Max){

     True_Label_Text = Label_Text.replace("...","");
     console.log(True_Label_Text);

     Label_Field.innerHTML = True_Label_Text + "...";


    Event.preventDefault();
  }

}

function Saving_Profile_Data(){
  var Path_JSON_Prefix = String(localStorage.getItem('Path_Prefix'));
  var Rebuilt_Path_Term = localStorage.getItem('Rebuilt_Path');
  var Profile_Data_Stream = fs.readFileSync(Rebuilt_Path_Term+'Main_Profile.json');
  var Profile_Data = JSON.parse(Profile_Data_Stream);

Profile_Data.Nickname = (document.getElementById("Name_Label").innerHTML);
Profile_Data.School_Name = (document.getElementById("School_Label").innerHTML);
Profile_Data.Major_Program = (document.getElementById("Program_Label").innerHTML);

  var Path_JSON_Prefix = String(localStorage.getItem('Path_Prefix'));
  Profile_Data_Output_Stream = JSON.stringify(Profile_Data,null,2);
  var Rebuilt_Path_Term = localStorage.getItem('Rebuilt_Path');
  fs.writeFile(Rebuilt_Path_Term+'Main_Profile.json',Profile_Data_Output_Stream,Completed);

  function Completed(err){
      // console.log('All saved');
    }

}

function Export_To_PDF(){

Path_Name = localStorage.getItem('Path_Prefix');
Path_Name_Components = Path_Name.split("/");
Desktop_Directory_Rebuild = String(Path_Name_Components[0]) + "/" + String(Path_Name_Components[1]) + "/" + String(Path_Name_Components[2]) + "/Desktop/";
// Desktop_Directory_Rebuild_2 = String(Path_Name_Components[0]) + "/" + String(Path_Name_Components[1]) + "/" + String(Path_Name_Components[2]) + "/OneDrive/Desktop/";
console.log(Desktop_Directory_Rebuild);

// console.log("Export to PDF");
const Main_Window = remote.getCurrentWindow();
let Home_Directory = require("os").homedir();
let Desktop_Directory = Home_Directory + String("/Desktop/GPA_Grapher.png");
// console.log(Desktop_Directory);


Main_Window.webContents.capturePage().then(Grapher_Image =>
    {
      //writing  image to the disk
          fs.writeFile(Desktop_Directory_Rebuild, Grapher_Image.toPNG(), (err) => {
          if (err) throw err
          console.log('Image Saved')
          })
    });


    var Export_Notification = document.getElementById("Exported_Image_Notification");
    Export_Notification.classList.remove('Pulse_Animation');
    void Export_Notification.offsetWidth;
    Export_Notification.classList.add('Pulse_Animation');

}

function Copy_Image(Image_File_Path){

  var Button_Index = 0;
  var Number_Of_Courses = 120;
  for(Button_Index = 1; Button_Index <= Number_Of_Courses; Button_Index++){

  var Button_ID = "Course_Edit_Button_" + String(Button_Index);
  // console.log(Button_ID);
  var Button_Object = document.getElementById(Button_ID);

  if(String(Button_Object.innerHTML) == "done"){
  console.log("Press");
  Edit_Course_Card(Button_Index)
  }

  }

  let Profile_Edit_Button = document.getElementById("Edit_Button");
  if(String(Profile_Edit_Button.innerHTML) == "done"){
  Edit();
  }

  // console.log(Image_File_Path);

  var Rebuilt_Path_Term = localStorage.getItem('Rebuilt_Path');
  var Local_Profile_Data_Path =  String(Rebuilt_Path_Term + "Profile_Image.png");
  console.log(Local_Profile_Data_Path);


// destination will be created or overwritten by default.
fs.copyFile(Image_File_Path, Local_Profile_Data_Path, (err) => {


  if (err) throw err;
  console.log("Profile image set");
  });


  // document.getElementById('Drop_File').style.backgroundImage = "url('/Users/michael/Desktop/GPA Grapher.app/Contents/Resources/app/Profile_Image.png')";

  const Main_Window = remote.getCurrentWindow();
  Main_Window.reload();

}

function Glow_Profile_Border(){
var Profile_Ring = document.getElementById("Profile_Island");

Profile_Ring.classList.remove('Glow_Pulse_Animation');
void Profile_Ring.offsetWidth;
Profile_Ring.classList.add('Glow_Pulse_Animation');
Profile_Ring.style.borderColor = "rgba(255,255,255,0.85)";
}

function Deglow_Profile_Border(){
  var Profile_Ring_Out = document.getElementById("Profile_Island");

  Profile_Ring_Out.classList.remove('Deglow_Pulse_Animation');
  void Profile_Ring_Out.offsetWidth;
  Profile_Ring_Out.classList.add('Deglow_Pulse_Animation');
  Profile_Ring_Out.style.borderColor = "rgba(255,255,255,0.5)";

}
