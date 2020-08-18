function Check(Grid){
// console.log("Checking");

// console.log(Grid);


// Loop scanning through targets
let Number_Of_Rows = 6;
let Number_Of_Columns = 7;
var Row_Scanner = 0;
var Column_Scanner = 0;

for(Row_Scanner = 0; Row_Scanner < Number_Of_Rows; Row_Scanner++){
for(Column_Scanner = 0; Column_Scanner < Number_Of_Columns; Column_Scanner++){

var Coordinate = Array(1).fill().map(() => Array(2).fill(0));

Coordinate[0][0] = Row_Scanner;
Coordinate[0][1] = Column_Scanner;
Check_1 = Check_Vertical(Grid,Coordinate);
Check_2 = Check_Horizontal(Grid,Coordinate);
Check_3 = Check_Northwest(Grid,Coordinate);
Check_4 = Check_Northeast(Grid,Coordinate);

if(Check_1 != "false"){
// console.log(Check_1);
// document.getElementById("Win_Panel").style.visible;
return Check_1;
break;
}

if(Check_2 != "false"){
// console.log(Check_2);
// document.getElementById("Win_Panel").visible;
return Check_2;
break;
}

if(Check_3 != "false"){
// console.log(Check_3);
// document.getElementById("Win_Panel").visible;

return Check_3;
break;
}


if(Check_4 != "false"){
// console.log(Check_4);
// document.getElementById("Win_Panel").visible;
var Win_Panel = document.getElementById("Win_Panel");
Win_Panel.innerHTML = String(Check_4);
Win_Panel.classList.remove("Notification_Drop_Animation");
void Win_Panel.offsetWidth;
Win_Panel.classList.add("Notification_Drop_Animation");
return Check_4;
break;
}


}
}


}

function Check_Vertical(Grid,Coordinate){
  // console.log(Coordinate);
  var Win_State = "false";
  var Row = Coordinate[0][0];
  var Column = Coordinate[0][1];

  let Number_Of_Rows = 6;
  let Number_Of_Columns = 7;

  var Value_1 = 0;
  var Value_2 = 0;
  var Value_3 = 0;
  var Value_4 = 0;

    Value_1 = Grid[Row][Column];

  if(Row-1 >= 0 && Row-1 < Number_Of_Rows){
    Value_2 = Grid[Row-1][Column];
  }

  if(Row-2 >= 0 && Row-2 < Number_Of_Rows){
    Value_3 = Grid[Row-2][Column];
  }

  if(Row-3 >= 0 && Row-3 < Number_Of_Rows){
    Value_4 = Grid[Row-3][Column];
  }

var Kernel = [Value_1,Value_2,Value_3,Value_4];
// console.log(String(Kernel));


if(String(Kernel) == "Red,Red,Red,Red"){
  // console.log("Found solution: red won");
  Win_State = "Red wins";
}

if(String(Kernel) == "Yellow,Yellow,Yellow,Yellow"){
  // console.log("Found solution: yellow won");
  Win_State = "Yellow wins";
}

return Win_State
}

function Check_Horizontal(Grid,Coordinate){
  // console.log(Coordinate);
  var Win_State = "false";
  var Row = Coordinate[0][0];
  var Column = Coordinate[0][1];

  // console.log(Column);
  let Number_Of_Rows = 6;
  let Number_Of_Columns = 7;

  var Value_1 = 0;
  var Value_2 = 0;
  var Value_3 = 0;
  var Value_4 = 0;

    Value_1 = Grid[Row][Column];

  if(Column-1 >= 0 && Column-1 < Number_Of_Columns){
    Value_2 = Grid[Row][Column-1];
  }

  if(Column-2 >= 0 && Column-2 < Number_Of_Columns){
    Value_3 = Grid[Row][Column-2];
  }

  if(Column-3 >= 0 && Column-3 < Number_Of_Columns){
    Value_4 = Grid[Row][Column-3];
  }

var Kernel = [Value_1,Value_2,Value_3,Value_4];
// console.log(String(Kernel));


if(String(Kernel) == "Red,Red,Red,Red"){
  // console.log("Found solution: red won");
  Win_State = "Red wins";

}

if(String(Kernel) == "Yellow,Yellow,Yellow,Yellow"){
  // console.log("Found solution: yellow won");
  Win_State = "Yellow wins";

}

return Win_State
}


function Check_Northwest(Grid,Coordinate){
  // console.log(Coordinate);
  var Win_State = "false";
  var Row = Coordinate[0][0];
  var Column = Coordinate[0][1];

  // console.log(Column);
  let Number_Of_Rows = 6;
  let Number_Of_Columns = 7;

  var Value_1 = 0;
  var Value_2 = 0;
  var Value_3 = 0;
  var Value_4 = 0;

    Value_1 = Grid[Row][Column];

  if(Row-1 >= 0 && Row-1 < Number_Of_Rows&&Column-1 >= 0 && Column-1 < Number_Of_Columns){
    Value_2 = Grid[Row-1][Column-1];
  }

  if(Row-2 >= 0 && Row-2 < Number_Of_Rows&&Column-2 >= 0 && Column-2 < Number_Of_Columns){
    Value_3 = Grid[Row-2][Column-2];
  }

  if(Row-3 >= 0 && Row-3 < Number_Of_Rows&&Column-3 >= 0 && Column-3 < Number_Of_Columns){
    Value_4 = Grid[Row-3][Column-3];
  }

var Kernel = [Value_1,Value_2,Value_3,Value_4];
// console.log(String(Kernel));


if(String(Kernel) == "Red,Red,Red,Red"){
  // console.log("Found solution: red won");
  Win_State = "Red wins";
}

if(String(Kernel) == "Yellow,Yellow,Yellow,Yellow"){
  // console.log("Found solution: yellow won");
  Win_State = "Yellow wins";
}

return Win_State
}

function Check_Northeast(Grid,Coordinate){
  // console.log(Coordinate);
  var Win_State = "false";
  var Row = Coordinate[0][0];
  var Column = Coordinate[0][1];

  // console.log(Column);
  let Number_Of_Rows = 6;
  let Number_Of_Columns = 7;

  var Value_1 = 0;
  var Value_2 = 0;
  var Value_3 = 0;
  var Value_4 = 0;

    Value_1 = Grid[Row][Column];

  if(Row-1 >= 0 && Row-1 < Number_Of_Rows&&Column+1 >= 0 && Column+1 < Number_Of_Columns){
    Value_2 = Grid[Row-1][Column+1];
  }

  if(Row-2 >= 0 && Row-2 < Number_Of_Rows&&Column+2 >= 0 && Column+2 < Number_Of_Columns){
    Value_3 = Grid[Row-2][Column+2];
  }

  if(Row-3 >= 0 && Row-3 < Number_Of_Rows&&Column+3 >= 0 && Column+3 < Number_Of_Columns){
    Value_4 = Grid[Row-3][Column+3];
  }

var Kernel = [Value_1,Value_2,Value_3,Value_4];
// console.log(String(Kernel));


if(String(Kernel) == "Red,Red,Red,Red"){
  // console.log("Found solution: red won");
  Win_State = "Red wins";
}

if(String(Kernel) == "Yellow,Yellow,Yellow,Yellow"){
  // console.log("Found solution: yellow won");
  Win_State = "Yellow wins";
}

return Win_State
}
