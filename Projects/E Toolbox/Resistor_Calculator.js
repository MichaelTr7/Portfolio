

window.onload = function(){
var Band_1_Button_Set = document.getElementsByClassName('Band_1_Buttons');
var Band_2_Button_Set = document.getElementsByClassName('Band_2_Buttons');
var Band_3_Button_Set = document.getElementsByClassName('Band_3_Buttons');
var Multiplier_Band_Button_Set = document.getElementsByClassName('Multiplier_Band_Buttons');
var Tolerance_Band_Button_Set = document.getElementsByClassName('Tolerance_Band_Buttons');

for (Button_Index = 0; Button_Index < Band_1_Button_Set.length; Button_Index ++){
  Band_1_Button_Set[Button_Index].addEventListener("click", Update_Resistor_Preview);
  Band_2_Button_Set[Button_Index].addEventListener("click", Update_Resistor_Preview);
  Band_3_Button_Set[Button_Index].addEventListener("click", Update_Resistor_Preview);
  Multiplier_Band_Button_Set[Button_Index].addEventListener("click", Update_Resistor_Preview);
  Tolerance_Band_Button_Set[Button_Index].addEventListener("click", Update_Resistor_Preview);
}
var Four_Band_Select_Button = document.getElementsByClassName('Select_4');
var Five_Band_Select_Button = document.getElementsByClassName('Select_5');
Four_Band_Select_Button[0].addEventListener("click",Four_Band_Resistor_Configuration);
Five_Band_Select_Button[0].addEventListener("click",Five_Band_Resistor_Configuration);

var LED_Light_Bar_1 = document.getElementsByClassName('LED_Light_Bar_1'); 
for(LED_Index = 0; LED_Index < LED_Light_Bar_1.length; LED_Index++){
  LED_Light_Bar_1[LED_Index].classList.add('LED_Light_Bar_Active');
}

var Slide_Menu_Button = document.getElementsByClassName('Slide_Menu_Button')[0];
Slide_Menu_Button.addEventListener("click",Slide_Menu_Button_Update);

}

function Update_Resistor_Preview(){  
  var Button_Descriptor = this.className; 
  var Band_Class = String(Button_Descriptor.split(" ")[0]);
  var Band_Value = String(Button_Descriptor.split(" ")[1]);
  var Button = document.getElementsByClassName(Button_Descriptor)[0];
  var Button_Colour = Button.style.backgroundColor;
    
  if(Band_Value != "Inactive"){
  var Band_Names = ["Band_1_Buttons","Band_2_Buttons","Band_3_Buttons","Multiplier_Band_Buttons","Tolerance_Band_Buttons"];  
  var Band_Index = Band_Names.indexOf(Band_Class);    
  var Resistor_Bands_Preview = document.getElementsByClassName('Resistor_Bands');
  var Resistor_Bands_Preview_2 = document.getElementsByClassName('Resistor_Bands_Vertical');
  var Button_Colour_Identifier = String(Button_Colour);
  
  var Colour_Dictionary = {
  "rgb(20, 20, 20)": "Black",
  "rgb(103, 49, 0)": "Brown",
  "rgb(255, 0, 0)": "Red",
  "rgb(255, 100, 0)": "Orange",
  "rgb(255, 184, 0)": "Yellow",
  "rgb(78, 200, 5)": "Green",
  "rgb(0, 51, 234)": "Blue",
  "rgb(112, 0, 255)": "Purple",
  "rgb(70, 70, 70)": "Grey",
  "rgb(245, 245, 245)": "White",
  "rgb(187, 135, 0)": "Gold",
  "rgb(150, 150, 150)": "Silver"
  };

  var Resistor_To_Change = Resistor_Bands_Preview[Band_Index];
  Resistor_To_Change.style.backgroundColor = Button_Colour;
  var Resistor_To_Change_2 = Resistor_Bands_Preview_2[Band_Index];
  Resistor_To_Change_2.style.backgroundColor = Button_Colour;
  var Colour_Name = Colour_Dictionary[Button_Colour_Identifier];
  Resistor_To_Change.innerHTML = Colour_Name;
  Resistor_To_Change_2.innerHTML = Colour_Name;
  // console.log(Band_Value);
  Calculate_Resistance();
}

}


function Four_Band_Resistor_Configuration(){
  var Status = document.getElementById('Four_Band_Label');
  Status_Style = window.getComputedStyle(Status);
  Status_Colour = String(Status_Style.getPropertyValue('color'));
  
  if(Status_Colour == "rgb(170, 170, 170)"){
  
  var Band_3_Label = document.getElementsByClassName('Band_3')[0];
  var Band_3_Holder = document.getElementsByClassName('Band_3_Holder')[0];
  var Four_Band_Select_Button = document.getElementsByClassName('Select_4')[0];
  var Five_Band_Select_Button = document.getElementsByClassName('Select_5')[0];
  Four_Band_Select_Button.style.color = "rgb(225,225,225)";
  Five_Band_Select_Button.style.color = "rgb(170,170,170)";

  Band_3_Label.classList.remove("Band_3_Active");
  Band_3_Holder.classList.remove("Band_3_Holder_Active");
  var Band_Strip_3 = document.getElementsByClassName('Band_Strip_3')[0];
  Band_Strip_3.innerHTML = "Black";
  
  var Resistor_Preview_Band_4 = document.getElementsByClassName('Band_Strip_3')[0];
  var Resistor_Preview_Band_4_Vertical = document.getElementsByClassName('Band_Strip_Vertical_3')[0];
  Resistor_Preview_Band_4.classList.remove("Band_Strip_3_Active");
  Resistor_Preview_Band_4_Vertical.classList.remove("Band_Strip_Vertical_3_Active");
  
  Resistor_Preview_Band_4.style.backgroundColor = "rgba(0,0,0,0)";
  Resistor_Preview_Band_4_Vertical.style.backgroundColor = "rgba(0,0,0,0)";
  Resistor_Preview_Band_4.style.boxShadow = "none";
  Resistor_Preview_Band_4_Vertical.style.boxShadow = "none";
  
  var LED_Light_Bar_1 = document.getElementsByClassName('LED_Light_Bar_1'); 
  var LED_Light_Bar_2 = document.getElementsByClassName('LED_Light_Bar_2'); 

  var LED_Light_Bar_1 = document.getElementsByClassName('LED_Light_Bar_1'); 
  for(LED_Index = 0; LED_Index < LED_Light_Bar_1.length; LED_Index++){
    LED_Light_Bar_1[LED_Index].classList.add('LED_Light_Bar_Active');
  }
  
  for(LED_Index = 0; LED_Index < LED_Light_Bar_2.length; LED_Index++){
    LED_Light_Bar_2[LED_Index].classList.remove('LED_Light_Bar_Active');
  }
  
  Calculate_Resistance();
  
}
}

function Five_Band_Resistor_Configuration(){
  var Status = document.getElementById('Five_Band_Label');
  Status_Style = window.getComputedStyle(Status);
  Status_Colour = String(Status_Style.getPropertyValue('color'));
  
  if(Status_Colour == "rgb(170, 170, 170)"){

  var Band_3_Label = document.getElementsByClassName('Band_3')[0];
  var Band_3_Holder = document.getElementsByClassName('Band_3_Holder')[0];
  Band_3_Label.classList.add("Band_3_Active");
  Band_3_Holder.classList.add("Band_3_Holder_Active");
  var Four_Band_Select_Button = document.getElementsByClassName('Select_4')[0];
  var Five_Band_Select_Button = document.getElementsByClassName('Select_5')[0];
  Four_Band_Select_Button.style.color = "rgb(170,170,170)";
  Five_Band_Select_Button.style.color = "rgb(225,225,225)";

  var Resistor_Preview_Band_4 = document.getElementsByClassName('Band_Strip_3')[0];
  var Resistor_Preview_Band_4_Vertical = document.getElementsByClassName('Band_Strip_Vertical_3')[0];
  Resistor_Preview_Band_4.classList.add("Band_Strip_3_Active");
  Resistor_Preview_Band_4_Vertical.classList.add("Band_Strip_Vertical_3_Active");
  
  Resistor_Preview_Band_4.style.backgroundColor = "rgba(20,20,20,1)";
  Resistor_Preview_Band_4_Vertical.style.backgroundColor = "rgba(20,20,20,1)";
  Resistor_Preview_Band_4.style.boxShadow = "0px 2px 1px rgba(0,0,0,0.5), inset 0px 0.5px 0.2px rgba(255,255,255,0.2)";
  Resistor_Preview_Band_4_Vertical.style.boxShadow = "0px 2px 1px rgba(0,0,0,0.5), inset 0px 0.5px 0.2px rgba(255,255,255,0.2)";

  var LED_Light_Bar_1 = document.getElementsByClassName('LED_Light_Bar_1'); 
  var LED_Light_Bar_2 = document.getElementsByClassName('LED_Light_Bar_2'); 
    
  for(LED_Index = 0; LED_Index < LED_Light_Bar_1.length; LED_Index++){
    LED_Light_Bar_1[LED_Index].classList.remove('LED_Light_Bar_Active');
  }
   
  for(LED_Index = 0; LED_Index < LED_Light_Bar_2.length; LED_Index++){
    LED_Light_Bar_2[LED_Index].classList.add('LED_Light_Bar_Active');
  }
  
  Calculate_Resistance();
  
}
}

function Slide_Menu_Button_Update(){
  var Slide_Menu_Button = document.getElementsByClassName('Slide_Menu_Button')[0];
  style = window.getComputedStyle(Slide_Menu_Button),
  Menu_Symbol_Text_Colour = String(style.getPropertyValue('color'));
  Slide_Menu_Button.classList.remove('Slide_Menu_Button_Rotate');
  Slide_Menu_Button.classList.remove('Slide_Menu_Button_Revert_Rotate');
  void Slide_Menu_Button.offsetWidth;

  if(Menu_Symbol_Text_Colour == "rgb(170, 170, 170)"){
    Slide_Menu_Button.classList.add('Slide_Menu_Button_Rotate');
  }
  
  if(Menu_Symbol_Text_Colour != "rgb(170, 170, 170)"){
    Slide_Menu_Button.classList.add('Slide_Menu_Button_Revert_Rotate');
  }
}


function Calculate_Resistance(){
  var Band_1_Colour_Name = String(document.getElementsByClassName('Band_Strip_1')[0].innerHTML);  
  var Band_2_Colour_Name = String(document.getElementsByClassName('Band_Strip_2')[0].innerHTML);  
  var Band_3_Colour_Name = String(document.getElementsByClassName('Band_Strip_3')[0].innerHTML);  
  var Multiplier_Band_Colour_Name = String(document.getElementsByClassName('Band_Strip_4')[0].innerHTML);  
  var Tolerance_Band_Colour_Name = String(document.getElementsByClassName('Band_Strip_5')[0].innerHTML);  

    var Colour_To_Digit_Dictionary = {
        "Black":"0",
        "Brown":"1",
        "Red":"2",
        "Orange":"3",
        "Yellow":"4",
        "Green":"5",
        "Blue":"6",
        "Purple":"7",
        "Grey":"8",
        "White":"9",
        "Gold":"10",
        "Silver":"11",
    }
    
    var Colour_To_Multiplier_Digit_Dictionary = {
      "Black":"",
      "Brown":"",
      "Red":"",
      "Orange":"",
      "Yellow":"",
      "Green":"",
      "Blue":"",
      "Purple":"",
      "Grey":"",
      "White":"",
      "Gold":"",
      "Silver":"",  
    }
    
    var Colour_To_Tolerance_Digit_Dictionary = {
      "Black":"",
      "Brown":"±1%",
      "Red":"±2%",
      "Orange":"",
      "Yellow":"",
      "Green":"±0.5%",
      "Blue":"±0.25%",
      "Purple":"±0.10%",
      "Grey":"±0.05%",
      "White":"",
      "Gold":"±5%",
      "Silver":"±10%",    
    }     
    
  
    if(Is_Four_Band_On()){
      var Colour_Array = [Band_1_Colour_Name,Band_2_Colour_Name,Multiplier_Band_Colour_Name,Tolerance_Band_Colour_Name];  
      var Digit_1 = Colour_To_Digit_Dictionary[Colour_Array[0]];
      var Digit_2 = Colour_To_Digit_Dictionary[Colour_Array[1]];
    }
    
    if(!Is_Four_Band_On()){
      var Colour_Array = [Band_1_Colour_Name,Band_2_Colour_Name,Band_3_Colour_Name,Multiplier_Band_Colour_Name,Tolerance_Band_Colour_Name];
      var Digit_1 = Colour_To_Digit_Dictionary[Colour_Array[0]];
      var Digit_2 = Colour_To_Digit_Dictionary[Colour_Array[1]];
      var Digit_3 = Colour_To_Digit_Dictionary[Colour_Array[2]];

    }
        


    
    
}

function Is_Four_Band_On(){
  var Four_Band_LED = document.getElementsByClassName('LED_Light_Bar_1')[0];
  style = window.getComputedStyle(Four_Band_LED),
  Four_Band_LED_Colour = String(style.getPropertyValue('color'));
  
  if(Four_Band_LED_Colour == "rgb(225, 225, 225)"){
    return true;
  }

  if(Four_Band_LED_Colour == "rgb(225, 225, 225)"){
    return false;
  }
  
}














