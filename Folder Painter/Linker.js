//JAVASCRIPT-PYTHON LINKER (Update_Folder_Preview.py, Paint_Folder.py)

// Importing "fs" for path checking
const fs = require("fs");

// Initializing previous hue and saturation to trivial values
var Previous_Hue_Value = -10;
var Previous_Saturation_Value = -10;
var Preview_Refresh_Interval = parseInt(150);


// FUNCTION: UPDATING THE FOLDER ICON PREVIEW IMAGE
window.setInterval(function Update_Image_Preview(){

// Grabbing the value of the hue slider
var Hue_Slider_Value = document.getElementById("Hue_Slider_Object").value;
// Parsing the value of the hue slider as an integer
Hue_Slider_Value = parseInt(Hue_Slider_Value);

// Grabbing the value of the saturation slider
var Saturation_Slider_Value = document.getElementById("Saturation_Slider_Object").value;
// Parsing the value of the saturation slider as an integer
Saturation_Slider_Value = parseInt(Saturation_Slider_Value) + parseInt(100);


// If the value of the hue slider (angle) is negative take the complement
if (Hue_Slider_Value <= 0){
    Hue_Slider_Value = 360 + Hue_Slider_Value;
}

// Checking if the either of the sliders values have changed since the last check interval
if ((Previous_Hue_Value != Hue_Slider_Value) || (Previous_Saturation_Value != Saturation_Slider_Value)){

    Previous_Hue_Value = Hue_Slider_Value;
    Previous_Saturation_Value = Saturation_Slider_Value;

    // console.log(["Hue Value",Hue_Slider_Value ,"Saturation Value",Saturation_Slider_Value]);

    // Opening up Python shell to run icon change python script "Paint_Folder.py"
    var {PythonShell} = require('python-shell');

    let options = {
    mode: 'text',
    encoding: 'utf8',
    pythonOptions: ['-u'],
    scriptPath: './',
    args: [Hue_Slider_Value, Saturation_Slider_Value],
    pythonPath: '/Users/michael/opt/anaconda3/bin/python'
    };

    PythonShell.run('./Update_Folder_Preview.py', options, function (err, results){
    if (err) throw err;
    // Logging hue and saturation values to the console
    // console.log('results: ', results);
    });
}

// Periodically updating the folder preview image
Preview_Image.src = "Adjusted_Folder_Image.png?" + new Date().getTime();

}, Preview_Refresh_Interval);

// Event listener for sliders

// document.getElementById("Hue_Slider_Container").addEventListener("oninput",Update_Hue());

// function Update_Hue(){
//   var Hue_Slider_Value = parseInt(document.getElementById("Hue_Slider_Object").value);
// // If the value of the hue slider (angle) is negative take the complement
// if (Hue_Slider_Value <= 0){
//     Hue_Slider_Value = 360 + Hue_Slider_Value;
// }
//
// Hue_Slider_Value = Hue_Slider_Value + 360;
// var Hue_Angle = 'hue-rotate(xdeg)'.replace('x',Hue_Slider_Value)
// console.log(Hue_Angle);
//
//
// // document.getElementById("Preview_Image").setAttribute("style",);
// document.getElementById('Preview_Image').style.filter = Hue_Angle;
//
//
// }
//


// FUNCTION: PAINTING THE FOLDER AT THE SPECIFIED PATH
function Paint_Button_Clicked(){

// Grabbing the target path from the path bar field
var Folder_Path_Name = document.getElementById("Path_Bar").value;

// // Opening a Python shell to run "Paint_Folder.py" script to paint the folder
// var {PythonShell} = require('python-shell');
//
//     let options = {
//     mode: 'text',
//     encoding: 'utf8',
//     pythonOptions: ['-u'],
//     scriptPath: './',
//     args: [Folder_Path_Name],
//     pythonPath: '/Users/michael/opt/anaconda3/bin/python'
//     };
//
//     PythonShell.run('./Paint_Folder.py', options, function (err, results){
//     });

    var Location = window.location.pathname;
    var Popped_Field = Location.split('/').pop();

    var Icon_Location = Location.replace("/"+Popped_Field,"");
    Icon_Location = Icon_Location + "/Adjusted_Folder_Image.png";


    console.log(Folder_Path_Name);
    console.log(Icon_Location);

    var Child_Process_Shell = require('child_process');


    var Child_Process_Object = Child_Process_Shell.spawn('./Change_Icon.bash', [Folder_Path_Name,Icon_Location]);
    Child_Process_Object.stdout.on('data', function(data) {
      // handle stdout as `data`
    });

// Setting the paint/select button to display "Done"
setTimeout(function(){document.getElementById("Select_Button").innerHTML = "Done";}, 3500);

}
