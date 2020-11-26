// const Remote_Electron = require('electron').remote
//
// // function to get the screen sizes
// function Get_Screen_Size(){
// const Display = Remote_Electron.screen.getPrimaryDisplay();
// const Screen_Size = Display.workAreaSize;
// const Screen_Height = Screen_Size.height;
// const Screen_Width = Screen_Size.width;
// return {Screen_Height, Screen_Width};
// }
//
const fs = require("fs");
const {remote} = require('electron');
function Reload(){

  const Main_Window = remote.getCurrentWindow();
  Main_Window.reload();
}

window.onload = function(){
// const {Screen_Height,Screen_Width} = Get_Screen_Size();
// console.log(Screen_Height);
// console.log(Screen_Width);
var Token = document.getElementById("Drop_Token");
Token.style.visibility = "hidden";
Token.classList.add("Drop_Animation");
setTimeout(function(){Token.style.visibility = "visible";},1000);

}

var Grid = Array(6).fill().map(() => Array(7).fill(0));



localStorage.setItem("Token_State",0);
localStorage.setItem("Token_Colour","Red");

function Clicked(){
var Token_State = localStorage.getItem("Token_State",1);
document.removeEventListener('mousemove', Move_Token)

if(Token_State == 0){
  document.addEventListener('mousemove',Move_Token);
  localStorage.setItem("Token_State",1);
}
if(Token_State == 1){
  // console.log("Drop token");
  localStorage.setItem("Token_State",0);
  Drop_Token_Column();
}



}

function Move_Token(e){
var Token = document.getElementById("Drop_Token");
var X_Position = parseInt(e.clientX);
var Y_Position = e.clientY;

// console.log(parseInt(X_Position));
if(parseInt(X_Position) >= 30 && parseInt(X_Position) <= 470){
  Token.style.left = parseInt(X_Position) - parseInt(20) + "px";

}

// console.log(parseInt(Token.style.left));
var Horizontal_Position = Token.style.left;


var Drop_Column = parseInt(Evaluate_Column(Horizontal_Position));
// console.log(Drop_Column);
var Indicator_Bank = document.getElementsByClassName('Indicator');
for(Index = 0; Index < Indicator_Bank.length; Index++){
  Indicator_Bank[Index].style.background = "rgba(60,222,238,0)";
}

if(Drop_Column >= 0 && Drop_Column <= 6){
if(String(Drop_Column) != "NaN"){
  var Drop_Column_Id = "Indicator_" + String(Drop_Column);
  // console.log(Drop_Column_Id);
  var Glowing_Indicator = document.getElementById(Drop_Column_Id);
  Glowing_Indicator.style.background = "rgba(60,222,238,1)";

}
}

}


function Evaluate_Column(Horizontal_Position){
var Position = parseInt(Horizontal_Position);
var Offset = 75;
Position = Position - Offset;
let Token_Radius = 20;
var Centre_Position = Position + Token_Radius;

var Left_Limit = 0;
var Right_Limit = 350;
if(Centre_Position >= Left_Limit && Centre_Position <= Right_Limit){
  var Index = Math.floor(Centre_Position/50);
  // console.log(Centre_Position)
  // console.log(Index);
return Index;
}

}

function Drop_Token_Column(){

  var Token_Colour = localStorage.getItem("Token_Colour");
  var Token = document.getElementById("Drop_Token");
  var Horizontal_Position = Token.style.left;
  var Drop_Column = parseInt(Evaluate_Column(Horizontal_Position));

  let Snap_Points = ["80px","130px","180px","230px","280px","330px","380px"];


  if(Drop_Column >= 0 && Drop_Column <= 6){


    var Snap_Position = Snap_Points[Drop_Column];
    Token.classList.add("Slide_Animation");


    var {Animate_Flag,Drop_Row} = Update_Grid_Array(Drop_Column,Token_Colour,Grid);
    // console.log(Animate_Flag);
    if(parseInt(Animate_Flag) == 1){


      document.querySelector('.Slide_Animation').style.setProperty('--Start_Position',Horizontal_Position);
      document.querySelector('.Slide_Animation').style.setProperty('--End_Position',Snap_Position);

      Token.classList.remove("Slide_Animation");
      void Token.offsetWidth;
      Token.classList.add("Slide_Animation");
      setTimeout(function(){Token.style.left = Snap_Position;
      var Drop_Length = (Drop_Row+1)*40 + (Drop_Row)*10 + 22;
      // console.log("Length: " + String(Drop_Length));


        document.querySelector('.Drop_Animation').style.setProperty('--Drop_Length', String(Drop_Length) +'px');
        Token.classList.remove("Drop_Animation");
        void Token.offsetWidth;
        Token.classList.add("Drop_Animation");
        var Convert_Sound = document.getElementById("Drop_Sound_Effect");
        Convert_Sound.volume = 0.7;
        Convert_Sound.play();

      },400);
    }


  }

var Win_Flag = Check(Grid);
console.log(String(Win_Flag));

if(String(Win_Flag) != "undefined"){

var Notification_Shade = document.getElementById("Win_Panel");
Notification_Shade.innerHTML = String(Win_Flag) + ": Click for New Game";
Notification_Shade.style.textAlign = "centre";
Notification_Shade.classList.remove("Notification_Drop_Animation");
void Notification_Shade.offsetWidth;
setTimeout(() => {Notification_Shade.classList.add("Notification_Drop_Animation");},1000);
setTimeout(() => {Notification_Shade.style.top = "5px";},1500);

}

}



function Update_Grid_Array(Column_Index,Token_Colour,Grid){

// console.log(Grid);
var Animate_Flag = 0;
var Drop_Row = "None";
for(Row = 5; Row >= 0; Row--){

// console.log(Row);
if(String(Grid[Row][Column_Index]) == "0"){
Drop_Row = Row;
break;
}

}

if(Drop_Row != "None"){
  Animate_Flag = 1;
  var Coordinates = String(Drop_Row) + "," + String(Column_Index);
  // console.log(Coordinates);
  Grid[Drop_Row][Column_Index] = String(Token_Colour);

  Counter_String = "Counter" + String(Drop_Row) + String(Column_Index);
  // console.log(Counter_String);
  Counter = document.getElementById(Counter_String);

  if(Token_Colour == "Red"){

  }

  if(Token_Colour == "Yellow"){

  }



  if(Token_Colour == "Red"){
    // console.log("Red dropped at column: " + String(Column_Index));
    localStorage.setItem("Token_Colour","Yellow");
    var Selected_Token = document.getElementById('Drop_Token');
    setTimeout(function(){Selected_Token.style.background = "rgba(255,214,17,1)";
    Counter.style.background = "rgba(240,50,50,1)";
    Selected_Token.style.visibility = "hidden";
    Selected_Token.style.left = "10px";
    setTimeout(function(){Selected_Token.style.visibility = "visible";},200);

  },1200);

  }

  if(Token_Colour == "Yellow"){
    // console.log("Yellow dropped at column: " + String(Column_Index));
    localStorage.setItem("Token_Colour","Red");
    var Selected_Token = document.getElementById('Drop_Token');
    setTimeout(function(){Selected_Token.style.background = "rgba(240,50,50,1)";
    Counter.style.background = "rgba(255,214,17,1)";
    Selected_Token.style.visibility = "hidden";
    Selected_Token.style.left = "10px";
    setTimeout(function(){Selected_Token.style.visibility = "visible";},200);

  },1200);

  }
}

return {Animate_Flag, Drop_Row};
}
