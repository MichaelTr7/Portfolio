//JAVASCRIPT-PYTHON LINKER (Update_Folder_Preview.py, Paint_Folder.py)

var {PythonShell} = require('python-shell');
var Replacement_Index = parseInt(0);

// Importing "fs" for path checking
const fs = require("fs");
Favourite_State = 0;


window.onload = function() {
  Reset_Favourite();

  // Grabbing the current JSON file
  var Favourite_Colours_Data_Starter_Stream = fs.readFileSync('Favourites.json');
  var Favourite_Colours_Start = JSON.parse(Favourite_Colours_Data_Starter_Stream);


  // Updating the favourites bank with newly added favourite
      Number_Of_Active_Favourites = parseInt(Favourite_Colours_Start.Red.length);
      console.log(Number_Of_Active_Favourites);

      var Colour_Key_Scanner;
      for (Colour_Key_Scanner = 0; Colour_Key_Scanner < Number_Of_Active_Favourites; Colour_Key_Scanner++){
      var Red_Key = parseInt(Favourite_Colours_Start.Red[Colour_Key_Scanner]);
      var Blue_Key = parseInt(Favourite_Colours_Start.Blue[Colour_Key_Scanner]);
      var Green_Key = parseInt(Favourite_Colours_Start.Green[Colour_Key_Scanner]);

    Key_Prefix = "Favourite_";
    Button_ID = Key_Prefix + String(Colour_Key_Scanner+1);

    console.log(Button_ID);
    Colour_Identifier = "rgba(R,G,B,1)";
    Colour_Identifier = Colour_Identifier.replace("R",String(Red_Key));
    Colour_Identifier = Colour_Identifier.replace("G",String(Green_Key));
    Colour_Identifier = Colour_Identifier.replace("B",String(Blue_Key));
    console.log(Colour_Identifier);

    document.getElementById(Button_ID).style.background = Colour_Identifier;

}
};

// Initializing previous hue and saturation to trivial values
var Previous_Hue_Value = -10;
var Previous_Saturation_Value = -10;
var Preview_Refresh_Interval = parseInt(200);


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


function Add_Favourite(Favourite_Button){

  if (Favourite_State == 0){
      // Just favourited
      Favourite_Button.parentNode.classList.add("checked");
      Favourite_State = 1;
      console.log("Favourited");

  }
   else{
      // Just unfavourited
      Favourite_Button.parentNode.classList.remove("checked");
      Favourite_State = 0;
      console.log("Unfavourited");
  }

  // Grabbing the value of the hue slider
  var Raw_Hue_Slider_Value = document.getElementById("Hue_Slider_Object").value;
  // Parsing the value of the hue slider as an integer
  Raw_Hue_Slider_Value = parseInt(Raw_Hue_Slider_Value);

  // Grabbing the value of the saturation slider
  var Raw_Saturation_Slider_Value = document.getElementById("Saturation_Slider_Object").value;
  // Parsing the value of the saturation slider as an integer
  Raw_Saturation_Slider_Value = parseInt(Raw_Saturation_Slider_Value);


// Grabbing the current JSON file
var Favourite_Colours_Data_Stream = fs.readFileSync('Favourites.json');
var Favourite_Colours = JSON.parse(Favourite_Colours_Data_Stream);


var New_Hue = [parseInt(Raw_Hue_Slider_Value)];
var New_Saturation = [parseInt(Raw_Saturation_Slider_Value)];
Current_Location = process.cwd();
Save_Thumbnail_Location = String(Current_Location) + "/Favourites/ColourID_" + String(New_Hue) + "_" + String(New_Saturation) + ".png";

var New_Path = [String(Save_Thumbnail_Location)];


console.log(Save_Thumbnail_Location);


// Saving the new colour
if(Favourite_State == 1){

// Generating path to save image

    var Retrieved_Hue_Array = Favourite_Colours.Hue;
    var Retrieved_Saturation_Array = Favourite_Colours.Saturation;
    var Retrieved_Path_Array = Favourite_Colours.Path;
    var Number_Of_Current_Colors = Retrieved_Hue_Array.length;

    if (Number_Of_Current_Colors < 10){
      // Updating the retrieved JSON arrays
      var Retrieved_Hue_Array = Retrieved_Hue_Array.concat(New_Hue);
      var Retrieved_Saturation_Array = Retrieved_Saturation_Array.concat(New_Saturation);
      var Retrieved_Path_Array = Retrieved_Path_Array.concat(New_Path);
    }


    Favourite_Colours.Hue = Retrieved_Hue_Array;
    Favourite_Colours.Saturation = Retrieved_Saturation_Array;
    Favourite_Colours.Path = Retrieved_Path_Array;


    Output_Favourite_Colours_Data_Stream = JSON.stringify(Favourite_Colours,null,2);
    fs.writeFile('Favourites.json',Output_Favourite_Colours_Data_Stream,Completed);

    function Completed(err){
        // console.log('All saved');
      }


    // Updating the favourites image folder

    // Opening a Python shell to run "Paint_Folder.py" script to paint the folder
    // var {PythonShell} = require('python-shell');

        let options = {
        mode: 'text',
        encoding: 'utf8',
        pythonOptions: ['-u'],
        scriptPath: './',
        args: [String(Save_Thumbnail_Location)],
        pythonPath: '/Users/michael/opt/anaconda3/bin/python'
        };

        PythonShell.run('./Save_Favourite.py', options, function (err, results){
        var Sample_Pixel = results;
        var Red_Sample = [parseInt(results[0])];
        var Blue_Sample = [parseInt(results[1])];
        var Green_Sample = [parseInt(results[2])];


        console.log("Red Value: " + Red_Sample);
        console.log("Green Value: " + Blue_Sample);
        console.log("Blue Value: " + Green_Sample);

        // Grabbing the current JSON file
        var Favourite_Colours_Data_Stream = fs.readFileSync('Favourites.json');
        var Favourite_Colours = JSON.parse(Favourite_Colours_Data_Stream);

        var Retrieved_Red_Array = Favourite_Colours.Red;
        var Retrieved_Blue_Array = Favourite_Colours.Green;
        var Retrieved_Green_Array = Favourite_Colours.Blue;

        if (Number_Of_Current_Colors < 10){
        var Retrieved_Red_Array = Retrieved_Red_Array.concat(Red_Sample);
        var Retrieved_Blue_Array = Retrieved_Blue_Array.concat(Blue_Sample);
        var Retrieved_Green_Array = Retrieved_Green_Array.concat(Green_Sample);
        }

        Favourite_Colours.Red = Retrieved_Red_Array;
        Favourite_Colours.Green = Retrieved_Blue_Array;
        Favourite_Colours.Blue = Retrieved_Green_Array;

        // Updating the favourites bank with newly added favourite
        Number_Of_Active_Favourites = parseInt(Favourite_Colours.Red.length);
        console.log(Number_Of_Active_Favourites);

        var Colour_Key_Scanner;
        for (Colour_Key_Scanner = 0; Colour_Key_Scanner < Number_Of_Active_Favourites; Colour_Key_Scanner++){
          var Red_Key = parseInt(Favourite_Colours.Red[Colour_Key_Scanner]);
          var Blue_Key = parseInt(Favourite_Colours.Blue[Colour_Key_Scanner]);
          var Green_Key = parseInt(Favourite_Colours.Green[Colour_Key_Scanner]);

        Key_Prefix = "Favourite_";
        Button_ID = Key_Prefix + String(Colour_Key_Scanner+1);

        console.log(Button_ID);
        Colour_Identifier = "rgba(R,G,B,1)";
        Colour_Identifier = Colour_Identifier.replace("R",String(Red_Key));
        Colour_Identifier = Colour_Identifier.replace("G",String(Green_Key));
        Colour_Identifier = Colour_Identifier.replace("B",String(Blue_Key));
        console.log(Colour_Identifier);


        document.getElementById(Button_ID).style.background = Colour_Identifier;


        }


        Output_Favourite_Colours_Data_Stream = JSON.stringify(Favourite_Colours,null,2);
        fs.writeFile('Favourites.json',Output_Favourite_Colours_Data_Stream,Completed);

        function Completed(err){
            // console.log('All saved');
          }

        });

}


if(Favourite_State == 0){

  // Grabbing the current JSON file
  var Favourite_Colours_Data_Stream = fs.readFileSync('Favourites.json');
  var Favourite_Colours_Deletion = JSON.parse(Favourite_Colours_Data_Stream);


// Retrieving the current arrays from the JSON object
  var Retrieved_Hue_Array = Favourite_Colours_Deletion.Hue;
  var Retrieved_Saturation_Array = Favourite_Colours_Deletion.Saturation;
  var Retrieved_Path_Array = Favourite_Colours_Deletion.Path;
  var Retrieved_Red_Array = Favourite_Colours_Deletion.Red;
  var Retrieved_Blue_Array = Favourite_Colours_Deletion.Blue;
  var Retrieved_Green_Array = Favourite_Colours_Deletion.Green;

// Scanning the arrays for the current slider values to remove
var Number_Of_Favourites = parseInt(Retrieved_Hue_Array.length);

for(Key_Scanner = 0; Key_Scanner < Number_Of_Favourites; Key_Scanner++){
Hue_Key_Value = parseInt(Retrieved_Hue_Array[Key_Scanner]);
Saturation_Key_Value = parseInt(Retrieved_Saturation_Array[Key_Scanner]);

console.log("Hue: " + String(Hue_Key_Value) + " Saturation: " + String(Saturation_Key_Value));

if((Hue_Key_Value == Raw_Hue_Slider_Value)&&(Saturation_Key_Value == Raw_Saturation_Slider_Value)){
  Retrieved_Hue_Array.splice(Key_Scanner,1);
  Retrieved_Saturation_Array.splice(Key_Scanner,1);
  Retrieved_Path_Array.splice(Key_Scanner,1);
  Retrieved_Red_Array.splice(Key_Scanner,1);
  Retrieved_Blue_Array.splice(Key_Scanner,1);
  Retrieved_Green_Array.splice(Key_Scanner,1);
  break;
}

}

Favourite_Colours_Deletion.Hue = Retrieved_Hue_Array;
Favourite_Colours_Deletion.Saturation = Retrieved_Saturation_Array;
Favourite_Colours_Deletion.Path = Retrieved_Path_Array;
Favourite_Colours_Deletion.Red = Retrieved_Red_Array;
Favourite_Colours_Deletion.Green = Retrieved_Green_Array;
Favourite_Colours_Deletion.Blue = Retrieved_Blue_Array;

document.getElementById("Favourite_1").style.background = "rgba(240, 240, 240, 1)";
document.getElementById("Favourite_2").style.background = "rgba(240, 240, 240, 1)";
document.getElementById("Favourite_3").style.background = "rgba(240, 240, 240, 1)";
document.getElementById("Favourite_4").style.background = "rgba(240, 240, 240, 1)";
document.getElementById("Favourite_5").style.background = "rgba(240, 240, 240, 1)";
document.getElementById("Favourite_6").style.background = "rgba(240, 240, 240, 1)";
document.getElementById("Favourite_7").style.background = "rgba(240, 240, 240, 1)";
document.getElementById("Favourite_8").style.background = "rgba(240, 240, 240, 1)";
document.getElementById("Favourite_9").style.background = "rgba(240, 240, 240, 1)";
document.getElementById("Favourite_10").style.background = "rgba(240, 240, 240, 1)";

//Updating the favourites bank with newly added favourite
Number_Of_Active_Favourites = parseInt(Favourite_Colours_Deletion.Red.length);
console.log(Number_Of_Active_Favourites);

var Colour_Key_Scanner;
for (Colour_Key_Scanner = 0; Colour_Key_Scanner < Number_Of_Active_Favourites; Colour_Key_Scanner++){
  var Red_Key = parseInt(Favourite_Colours_Deletion.Red[Colour_Key_Scanner]);
  var Blue_Key = parseInt(Favourite_Colours_Deletion.Blue[Colour_Key_Scanner]);
  var Green_Key = parseInt(Favourite_Colours_Deletion.Green[Colour_Key_Scanner]);

Key_Prefix = "Favourite_";
Button_ID = Key_Prefix + String(Colour_Key_Scanner+1);

console.log(Button_ID);
Colour_Identifier = "rgba(R,G,B,1)";
Colour_Identifier = Colour_Identifier.replace("R",String(Red_Key));
Colour_Identifier = Colour_Identifier.replace("G",String(Green_Key));
Colour_Identifier = Colour_Identifier.replace("B",String(Blue_Key));
console.log(Colour_Identifier);


document.getElementById(Button_ID).style.background = Colour_Identifier;


}

Output_Favourite_Colours_Data_Stream_Delete = JSON.stringify(Favourite_Colours_Deletion,null,2);
fs.writeFile('Favourites.json',Output_Favourite_Colours_Data_Stream_Delete,Completed);

}

function Completed(err){
    // console.log('All saved');
  }

  // Opening a Python shell to run "Paint_Folder.py" script to paint the folder
  // var {PythonShell} = require('python-shell');

      let options = {
      mode: 'text',
      encoding: 'utf8',
      pythonOptions: ['-u'],
      scriptPath: './',
      args: [Save_Thumbnail_Location],
      pythonPath: '/Users/michael/opt/anaconda3/bin/python'
      };

      PythonShell.run('./Delete_Favourite.py', options, function (err, results){
      });

      function Completed(err){
          // console.log('All saved');
        }

}



function Grab_Value(Favourite_Index){


  // Grabbing the current JSON file
  var Favourite_Colours_Data_Sender_Stream = fs.readFileSync('Favourites.json');
  var Favourite_Colours_Array = JSON.parse(Favourite_Colours_Data_Sender_Stream);

  var Length_Of_Database = parseInt(Favourite_Colours_Array.Hue.length);
  var Maximum_Index = Length_Of_Database - 1;
  // console.log(Maximum_Index);

  if (Favourite_Index-1 <= Maximum_Index){

    Hue_Key_ID = Favourite_Colours_Array.Hue[parseInt(Favourite_Index-1)];
    Saturation_Key_ID = Favourite_Colours_Array.Saturation[parseInt(Favourite_Index-1)];

    console.log("Hue: " + String(Hue_Key_ID) + " Saturation: " + String(Saturation_Key_ID));

    // If the value of the hue slider (angle) is negative take the complement
    document.getElementById("Hue_Slider_Object").value = Hue_Key_ID;
    document.getElementById("Saturation_Slider_Object").value = Saturation_Key_ID;

  }

}

var Drop_Down_State = 0;
function Reveal_Favourites(Drop_Down_Menu){

  Card_Panel = document.getElementById("Favourites_Card_Panel");

  if (Drop_Down_State == 0){
      // Just favourited
      Drop_Down_Menu.parentNode.classList.add("checked");
      console.log("checked");
      Drop_Down_State = 1;

      Card_Panel.classList.remove('Slide_Down_Animation'); // reset animation
      Card_Panel.classList.remove('Slide_Up_Animation'); // reset animation
      void Card_Panel.offsetWidth; // trigger reflow
      Card_Panel.classList.add('Slide_Up_Animation'); // start animation
      Card_Panel.style.marginTop = "195px";
  }
   else{
      // Just unfavourited

      Drop_Down_Menu.parentNode.classList.remove("checked");
      console.log("unchecked");
      Drop_Down_State = 0;
      Card_Panel.classList.remove('Slide_Down_Animation'); // reset animation
      Card_Panel.classList.remove('Slide_Up_Animation'); // reset animation
      void Card_Panel.offsetWidth; // trigger reflow
      Card_Panel.classList.add('Slide_Down_Animation'); // start animation
      Card_Panel.style.marginTop = "230px";
  }

}
