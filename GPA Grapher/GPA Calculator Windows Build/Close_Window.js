const remote_electron = require('electron').remote;


function Close_Window(){

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

setTimeout(function(){
  console.log("Closing window")
  var Main_Window = remote_electron.getCurrentWindow();
  Main_Window.close();
},1000);


}
