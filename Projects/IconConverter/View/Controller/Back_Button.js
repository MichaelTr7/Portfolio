localStorage.setItem("Results_Panel_Flag",0);


function Back_Button_Pressed(){
console.log("Back button");
var Results_Flag_Token = localStorage.getItem("Results_Panel_Flag");

if(Results_Flag_Token == 1){
  var Results_Panel = document.getElementById('Result_Panel');
  Results_Panel.classList.remove("Drop_Results_Animation");
  Results_Panel.classList.remove("Push_Results_Animation");
  Results_Panel.offsetWidth;
  Results_Panel.classList.add("Drop_Results_Animation");
  Results_Panel.style.top = "320px";

  var Overlay_Closed = document.getElementById("Closed_Overlay");
  Overlay_Closed.style.visibility = "hidden";

  var Exported_Alert = document.getElementById("Exported_Notification");
  setTimeout(() => {Exported_Alert.innerHTML = "Select OS";},1000);
  localStorage.setItem("Results_Panel_Flag",0);

}

}
