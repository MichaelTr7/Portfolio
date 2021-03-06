
Number_Of_Course_Cards = 121;
var Card_Edit_Status_Array = new Uint8Array(Number_Of_Course_Cards);

function Edit_Course_Card(Course_Card_Index){

  // console.log(Card_Edit_Status_Array);

  Course_Code_ID = "Course_Code_Label_" + String(Course_Card_Index);
  Course_Name_ID = "Course_Name_Label_" + String(Course_Card_Index);
  GPA_ID = "GPA_Label_" + String(Course_Card_Index);
  Weight_ID = "Weight_Label_" + String(Course_Card_Index);
  Edit_Button_ID = "Course_Edit_Button_" + String(Course_Card_Index);

  Course_Code_Object = document.getElementById(Course_Code_ID);
  Course_Name_Object = document.getElementById(Course_Name_ID);
  GPA_Object = document.getElementById(GPA_ID);
  Weight_Object = document.getElementById(Weight_ID);
  Edit_Button_Object = document.getElementById(Edit_Button_ID);


if(Card_Edit_Status_Array[parseInt(Course_Card_Index)] == 0){

Course_Code_Object.contentEditable = true;
Course_Name_Object.contentEditable = true;
GPA_Object.contentEditable = true;
Weight_Object.contentEditable = true;

Edit_Button_Object.innerHTML = "done";
Course_Code_Object.style.background = "rgba(0,0,0,0.1)";
Course_Name_Object.style.background = "rgba(0,0,0,0.1)";
GPA_Object.style.background = "rgba(0,0,0,0.1)";
Weight_Object.style.color = "rgba(0,217,215,1)";
Card_Edit_Status_Array[parseInt(Course_Card_Index)] = 1;
Edit_Button_Object.style.background = "rgba(253,78,83,0.9)";
Edit_Button_Object.style.border  = "rgba(253,78,83,0.9)";
}

else{

  Course_Code_Object.contentEditable = false;
  Course_Name_Object.contentEditable = false;
  GPA_Object.contentEditable = false;
  Weight_Object.contentEditable = false;

  Edit_Button_Object.innerHTML = "edit";
  Course_Code_Object.style.background = "rgba(0,0,0,0)";
  Course_Name_Object.style.background = "rgba(0,0,0,0)";
  GPA_Object.style.background = "rgba(0,0,0,0)";
  Weight_Object.style.color = "rgba(150, 150, 150, 1)";
  Card_Edit_Status_Array[parseInt(Course_Card_Index)] = 0;
  Edit_Button_Object.style.background = "rgba(200,200,200,1)";
  Edit_Button_Object.style.border = "rgba(200,200,200,1)";

  if(Course_Code_Object.innerText.length == 0){
    Course_Code_Object.innerText = "Course Code";
  }

  if(Course_Name_Object.innerText.length == 0){
    Course_Name_Object.innerText = "Course Name";
  }

  if(GPA_Object.innerText.length == 0){
    GPA_Object.innerText = "Score";
  }

  if(Weight_Object.innerText.length == 0){
    Weight_Object.innerText = "1.00";
  }
  // console.log("Saving");

  if(GPA_Object.innerText != "Score" && GPA_Object.innerText.length < 5){
  var Modified_GPA_String = GPA_Object.innerText;
  var GPA_Score_Length = GPA_Object.innerText.length;

  if(Modified_GPA_String[1] != "."){
    Modified_GPA_String = String(Modified_GPA_String) + ".";
    var Concatenation_Zero_Length = 5 - GPA_Score_Length - 1;
  }
  else{
    var Concatenation_Zero_Length = 5 - GPA_Score_Length;
  }

  var Concatenation = 0;
  for(Concatenation = 0; Concatenation < Concatenation_Zero_Length; Concatenation++){
  Modified_GPA_String = String(Modified_GPA_String) + "0";
  }

  GPA_Object.innerText = Modified_GPA_String;
  }

//

if(Weight_Object.innerText != "1.00" && Weight_Object.innerText.length < 4){
var Modified_Weight_String = Weight_Object.innerText;
var Weight_Score_Length = Weight_Object.innerText.length;

if(Modified_Weight_String[1] != "."){
  Modified_Weight_String = String(Modified_Weight_String) + ".";
  var Concatenation_Zero_Length = 4 - Weight_Score_Length - 1;
}
else{
  var Concatenation_Zero_Length = 4 - Weight_Score_Length;
}

var Concatenation = 0;
for(Concatenation = 0; Concatenation < Concatenation_Zero_Length; Concatenation++){
Modified_Weight_String = String(Modified_Weight_String) + "0";
}

Weight_Object.innerText = Modified_Weight_String;
}

Saving_Course_Bank_Data(Course_Card_Index);
setTimeout(function(){
  GPA_Data = Update_Graph_Data();
  Term_GPA_Data_Points = GPA_Data[0];
  Cumulative_GPA_Data_Points = GPA_Data[1];
  Update_Graph_Display(Term_GPA_Data_Points,Cumulative_GPA_Data_Points);
  Update_PI_Graph_Data();
  // console.log(Term_GPA_Data);
}, 100);


}


}


function Block_Enter(Element,Event){

  var Key_Pressed = Event.which;
  var Key_Code =  Event.keyCode;

  if (Key_Pressed == 13 && Key_Code == 13) {
    Event.preventDefault();
  }

}



function Key_Pressed_Course(Element,Event){

  var Key_Pressed = Event.which;
  var Key_Code =  Event.keyCode;

  let Valid_Keys = [
  49,
  50,
  51,
  52,
  53,
  54,
  55,
  56,
  57,
  48,
  46
  ];


  if (Key_Pressed == 13 && Key_Code == 13) {
    Event.preventDefault();
  }






  var Label_Field = document.getElementById(Element.id);

  var Label_Text = (Label_Field.textContent);
  var Text_Length = Label_Text.length + 1;
  var Label_Field_Max = Element.getAttribute("max");

  if(Text_Length >= Label_Field_Max){
     Label_Field.innerHTML = Label_Text;
    Event.preventDefault();
  }

}

localStorage.setItem('Previously_Selected_Semester_Index',1);

function Selecting_Semester(Semester_Index){
var Previous_Semester_Index = localStorage.getItem('Previously_Selected_Semester_Index');


Term_ID = "Term_" + String(Semester_Index);
Previous_Term_ID = "Term_" + String(Previous_Semester_Index);


var Current_Term = document.getElementById(Term_ID);
var Previous_Term = document.getElementById(Previous_Term_ID);
var Glowing_Select = document.getElementById("Semester_"+String(Semester_Index));
var Unglowing_Select = document.getElementById("Semester_"+String(Previous_Semester_Index));
var Shader_Overlay = document.getElementById("Shader");


if(Previous_Term != Current_Term){

  Glowing_Select.classList.remove('Glow_Animation');
  void Glowing_Select.offsetWidth;
  Glowing_Select.classList.add('Glow_Animation');

  Glowing_Select.style.color = "rgba(255,255,255,0.7)";
  Unglowing_Select.style.color = "rgba(255,255,255,0.2)";

  Shader_Overlay.classList.remove('Fade_Sequence_Animation'); // reset animation
  Shader_Overlay.classList.remove('Fade_Sequence_Animation_In'); // reset animation
  void Shader_Overlay.offsetWidth; // trigger reflow
  void Shader_Overlay.offsetWidth; // trigger reflow


  Shader_Overlay.classList.add('Fade_Sequence_Animation'); // start animation
  Shader_Overlay.style.filter = "opacity(1)";
  Shader_Overlay.style.visibility = "visible";

  setTimeout(function() {Previous_Term.style.visibility = "hidden";
    Current_Term.style.visibility = "visible";}, 310);

    setTimeout(function() {
      Shader_Overlay.classList.add('Fade_Sequence_Animation_In'); // start animation
      Shader_Overlay.style.filter = "opacity(0)";
      Shader_Overlay.style.visibility = "hidden";
    }, 1500);


}

// console.log("Previous:"+String(Previous_Semester_Index));

Previous_Semester_Index = parseInt(Semester_Index);
localStorage.setItem('Previously_Selected_Semester_Index',Previous_Semester_Index);

}

function Saving_Course_Bank_Data(Card_Index){
// console.log("Saving Card " + String(Card_Index));

var Path_JSON_Prefix = String(localStorage.getItem('Path_Prefix'));
var Course_Bank_Data_Stream = fs.readFileSync(Path_JSON_Prefix+'Course_Bank.json');
var Course_Bank_Data = JSON.parse(Course_Bank_Data_Stream);

// console.log(Course_Bank_Data);

var Current_Course_Code = document.getElementById("Course_Code_Label_" + String(Card_Index)).innerHTML;
var Current_Course_Name = document.getElementById("Course_Name_Label_" + String(Card_Index)).innerHTML;
var Current_Course_GPA = document.getElementById("GPA_Label_" + String(Card_Index)).innerHTML;
var Current_Course_Weight = document.getElementById("Weight_Label_" + String(Card_Index)).innerHTML;

// Updating the data in the JSON
if(String(Current_Course_GPA) != "Score"){
  Course_Bank_Data.Course_Codes[parseInt(Card_Index)-1] = Current_Course_Code;
  Course_Bank_Data.Course_Names[parseInt(Card_Index)-1] = Current_Course_Name;
  Course_Bank_Data.GPA_Scores[parseInt(Card_Index)-1] = Current_Course_GPA;
  Course_Bank_Data.Weights[parseInt(Card_Index)-1] = Current_Course_Weight;


var Course_Block_Object = document.getElementById("Course_Block_" + String(Card_Index));
  Course_Block_Object.classList.remove('Border_Ring_Animation');
  void Course_Block_Object.offsetWidth;
  Course_Block_Object.classList.add('Border_Ring_Animation');
  Course_Block_Object.style.borderColor = "rgba(253,78,83,1)";
}

if(String(Current_Course_GPA) == "Score"){
  Course_Bank_Data.Course_Codes[parseInt(Card_Index)-1] = Current_Course_Code;
  Course_Bank_Data.Course_Names[parseInt(Card_Index)-1] = Current_Course_Name;
  Course_Bank_Data.GPA_Scores[parseInt(Card_Index)-1] = Current_Course_GPA;
  Course_Bank_Data.Weights[parseInt(Card_Index)-1] = Current_Course_Weight;


  var Course_Block_Object = document.getElementById("Course_Block_" + String(Card_Index));
    Course_Block_Object.classList.remove('Border_Ring_Animation_Fade');
    void Course_Block_Object.offsetWidth;
    Course_Block_Object.classList.add('Border_Ring_Animation_Fade');
    Course_Block_Object.style.borderColor = "rgba(0,0,0,0.2)";
}


Course_Bank_Data_Output_Stream = JSON.stringify(Course_Bank_Data,null,2);
var Path_JSON_Prefix = String(localStorage.getItem('Path_Prefix'));
fs.writeFile(Path_JSON_Prefix+'Course_Bank.json',Course_Bank_Data_Output_Stream,Completed);

function Completed(err){
    // console.log('All saved');
  }

}


window.onload = function(){

  var Path_Name = String(window.location);
  Path_Name = String(Path_Name.replace("Main_Panel.html",""));
  Path_Name = String(Path_Name.replace("file://",""));
  Path_Name = String(decodeURI(Path_Name));
  // Path_Name = "/Users/michael/Desktop/GPA Grapher.app/Contents/Resources/app/"
  // Path_Name = String(Path_Name) + 'Course_Bank.json';
  localStorage.setItem('Path_Prefix',Path_Name);

  var Profile_Icon_URL = "'" + Path_Name + "Profile_Image.png'"
  Profile_Icon_URL_Template = "url(Link)";
  Profile_Icon_URL_Template = Profile_Icon_URL_Template.replace("Link",Profile_Icon_URL);


  console.log(String(Profile_Icon_URL_Template));
  localStorage.setItem('Profile_Icon_Path',Profile_Icon_URL_Template);

  // document.getElementById('Drop_File').style.backgroundImage = "url('/Users/michael/Desktop/GPA Grapher.app/Contents/Resources/app/Profile_Image.png')";
  document.getElementById('Drop_File').style.setProperty('background-image',Profile_Icon_URL_Template);
  var Path_JSON_Prefix = String(localStorage.getItem('Path_Prefix'));
  var Profile_Data_Stream = fs.readFileSync(Path_JSON_Prefix+'Main_Profile.json');
  var Profile_Data = JSON.parse(Profile_Data_Stream);

  var Nickname_Data = Profile_Data.Nickname;
  var School_Name_Data = Profile_Data.School_Name;
  var Major_Program_Data = Profile_Data.Major_Program;

    if(Nickname_Data.length != 0){
      document.getElementById("Name_Label").innerHTML =  Nickname_Data;
    }

    if(School_Name_Data.length != 0){
      document.getElementById("School_Label").innerHTML = School_Name_Data;
    }

    if(Major_Program_Data.length != 0){
      document.getElementById("Program_Label").innerHTML = Major_Program_Data;
    }

  var Path_JSON_Prefix = String(localStorage.getItem('Path_Prefix'));
  var Course_Bank_Data_Stream = fs.readFileSync(Path_JSON_Prefix+'Course_Bank.json');
  var Course_Bank_Data = JSON.parse(Course_Bank_Data_Stream);

  var Course_Code_Data = Course_Bank_Data.Course_Codes;
  var Course_Names_Data = Course_Bank_Data.Course_Names;
  var GPA_Scores_Data = Course_Bank_Data.GPA_Scores;
  var Weight_Data = Course_Bank_Data.Weights;


  var Course_Index = 0;
  var Maximum_Index = Course_Code_Data.length;
  for(Course_Index = 0; Course_Index < Maximum_Index; Course_Index++){

  var Card_Value_Index = parseInt(Course_Index+1);
  var Course_Code_Label_ID = "Course_Code_Label_" + String(Card_Value_Index);
  var Course_Name_Label_ID = "Course_Name_Label_" + String(Card_Value_Index);
  var GPA_Score_Label_ID = "GPA_Label_" + String(Card_Value_Index);
  var Weight_Label_ID = "Weight_Label_" + String(Card_Value_Index);


    if(Course_Code_Data.length != 0 && Course_Code_Data[parseInt(Course_Index)] != null){
      document.getElementById(Course_Code_Label_ID).innerHTML =  Course_Code_Data[parseInt(Course_Index)];
    }

    if(Course_Names_Data.length != 0 && Course_Names_Data[parseInt(Course_Index)] != null){
      document.getElementById(Course_Name_Label_ID).innerHTML = Course_Names_Data[parseInt(Course_Index)];
    }

    if(GPA_Scores_Data.length != 0 && GPA_Scores_Data[parseInt(Course_Index)] != null){
      document.getElementById(GPA_Score_Label_ID).innerHTML = GPA_Scores_Data[parseInt(Course_Index)];
      var GPA_Score_Value = document.getElementById(GPA_Score_Label_ID).innerHTML;

      if(GPA_Score_Value != "Score"){
        var Course_Block_Object = document.getElementById("Course_Block_" + String(Card_Value_Index));
        Course_Block_Object.classList.remove('Border_Ring_Animation');
        void Course_Block_Object.offsetWidth;
        Course_Block_Object.classList.add('Border_Ring_Animation');
        Course_Block_Object.style.borderColor = "rgba(253,78,83,1)";
      }


    }

    if(Weight_Data.length != 0 && Weight_Data[parseInt(Course_Index)] != null){
      document.getElementById(Weight_Label_ID).innerHTML = Weight_Data[parseInt(Course_Index)];
    }


  }



  GPA_Data = Update_Graph_Data();
  Term_GPA_Data_Points = GPA_Data[0];
  Cumulative_GPA_Data_Points = GPA_Data[1];
  Update_Graph_Display(Term_GPA_Data_Points,Cumulative_GPA_Data_Points);
  // console.log(Term_GPA_Data);
  Update_PI_Graph_Data();

  // var Path_Name = window.location.href;
  // console.log(Path_Name);


};


function Update_Graph_Data(){


var Path_JSON_Prefix = String(localStorage.getItem('Path_Prefix'));
// console.log('/Users/michael/Desktop/GPA Calculator/GPA Grapher-darwin-x64/GPA Grapher.app/Contents/Resources/app/Course_Bank.json');
var Course_Bank_Read_Stream = fs.readFileSync(Path_JSON_Prefix+'Course_Bank.json');
var Course_Bank_Information = JSON.parse(Course_Bank_Read_Stream);

// console.log(Course_Bank_Information);

var Complete_GPA_Array = Course_Bank_Information.GPA_Scores;
var Complete_Weight_Array = Course_Bank_Information.Weights;


let Number_Of_Courses = 120;
var Weighted_Sum_Array = new Array(Number_Of_Courses).fill(0);
var Weight_Array =  new Array(Number_Of_Courses).fill(0);

var Column = 0;
for(Column = 0; Column < 120; Column++){

var GPA_Score_Token = Complete_GPA_Array[Column];
var Weight_Token = Complete_Weight_Array[Column];

// Only take the course value if valid GPA score is given
if(GPA_Score_Token != "Score" && GPA_Score_Token != null){

Weighted_Sum_Array[Column] = parseFloat(GPA_Score_Token)*parseFloat(Weight_Token);
Weight_Array[Column] = Weight_Token;
}
}

// console.log(Weighted_Sum_Array);
// console.log(Weight_Array);

let Number_Of_Terms = 8;
var Term_Weighted_Sums = new Array(Number_Of_Terms).fill(0);
var Term_Sum_Of_Weights = new Array(Number_Of_Terms).fill(0);


var Term_Index = 0;
var Target = 0;
for(Target = 0; Target < Number_Of_Courses; Target = Target + 15){

var Column_Scanner = 0;
for(Column_Scanner = Target; Column_Scanner < Target+15; Column_Scanner++){
Term_Weighted_Sums[Term_Index] = parseFloat(Term_Weighted_Sums[Term_Index]) + parseFloat(Weighted_Sum_Array[Column_Scanner]);
Term_Sum_Of_Weights[Term_Index] = parseFloat(Term_Sum_Of_Weights[Term_Index]) + parseFloat(Weight_Array[Column_Scanner]);

}
Term_Index = Term_Index + 1;
}

// const Is_Not_Defined = (element) => element == 0;
// var Lastest_Term = Term_Weighted_Sums.findIndex(Is_Not_Defined);
//
// console.log((Lastest_Term));
// if(Latest_Term < 0){
//   Latest_Term = 7;
// }

var Latest_Term = 8;
for(Column_Scanner = 0; Column_Scanner < Term_Weighted_Sums.length; Column_Scanner++){

if(Term_Weighted_Sums[Column_Scanner] == 0){
Latest_Term = Column_Scanner;
break;
}

}


var Term_Averages = new Array(Latest_Term).fill(0);



for(Column_Scanner = 0; Column_Scanner < Latest_Term; Column_Scanner++){
if(Term_Sum_Of_Weights[Column_Scanner] != 0){
  Term_Averages[Column_Scanner] = (parseFloat(Term_Weighted_Sums[Column_Scanner])/parseFloat(Term_Sum_Of_Weights[Column_Scanner])).toFixed(3);
}
}

var Term_GPA = Term_Averages;

// Calculating the cumulative GPA
// console.log(Term_Weighted_Sums);
// console.log(Term_Sum_Of_Weights);

var Cumulative_GPA = new Array(8).fill(0);
var Aggregate_GPA = new Array(8).fill(0);
var Aggregate_Weight = new Array(8).fill(0);


// const Is_Zero = (element) => element == 0;
// var Latest_Semester = Term_Sum_Of_Weights.findIndex(Is_Zero);
// // console.log(Latest_Semester);
// if(Latest_Semester == "-1"){
//   Latest_Semester = 7;
// }


var Latest_Semester = 8;
for(Column_Scanner = 0; Column_Scanner < Term_Weighted_Sums.length; Column_Scanner++){

if(Term_Weighted_Sums[Column_Scanner] == 0){
Latest_Semester = Column_Scanner;
break;
}

}

//Calculating the 8 CGPA
var Target = 0;
for(Target = 0; Target < Latest_Semester; Target++){

  // console.log("Target "+Target);
var Semester_Scanner = 0;
for(Semester_Scanner = 0; Semester_Scanner <= Target; Semester_Scanner++){
// console.log(Semester_Scanner);

Aggregate_GPA[Target] = Aggregate_GPA[Target] + Term_Weighted_Sums[Semester_Scanner];
Aggregate_Weight[Target] = Aggregate_Weight[Target] + Term_Sum_Of_Weights[Semester_Scanner];

}

}

var Cumulative_GPA_Array = new Array(Latest_Semester).fill(0);
var Column_Scanner = 0;
for(Column_Scanner = 0; Column_Scanner < Cumulative_GPA_Array.length; Column_Scanner++){

Cumulative_GPA_Array[Column_Scanner] = (parseFloat(Aggregate_GPA[Column_Scanner])/parseFloat(Aggregate_Weight[Column_Scanner])).toFixed(3);

}

return [Term_GPA, Cumulative_GPA_Array];

}



function Update_PI_Graph_Data(){

var Number_Of_Categories = 5;
var Distribution_Array = new Array(Number_Of_Categories).fill(0);

var Course_Index = 1;
var Course_Bank_Size = 120;
for(Course_Index = 1; Course_Index <= Course_Bank_Size; Course_Index++){

var GPA_Element_ID = "GPA_Label_" + String(Course_Index);
GPA_Token_Value = parseFloat(document.getElementById(GPA_Element_ID).innerHTML);

if(GPA_Token_Value >= 0 && GPA_Token_Value < 1.0){
Distribution_Array[0] = Distribution_Array[0] + 1;
}

if(GPA_Token_Value >= 1.0 && GPA_Token_Value < 2.0){
Distribution_Array[1] = Distribution_Array[1] + 1;
}

if(GPA_Token_Value >= 2.0 && GPA_Token_Value < 3.0){
Distribution_Array[2] = Distribution_Array[2] + 1;
}

if(GPA_Token_Value >= 3.0 && GPA_Token_Value < 4.0){
Distribution_Array[3] = Distribution_Array[3] + 1;
}

if(GPA_Token_Value >= 4.0 && GPA_Token_Value < 5.0){
Distribution_Array[4] = Distribution_Array[4] + 1;
}

}

// console.log(Distribution_Array);
PIGraph.data.datasets[0].data = Distribution_Array;
PIGraph.update();


}
