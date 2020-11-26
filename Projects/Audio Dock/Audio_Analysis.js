

// Preparing constant for microphone input
let Microphone_Input;
let fft;

// Initializing the value that will scan randomly through the "Aura_Array"
localStorage.setItem('Colour_Flag',0);

// Array for dynamic colour changing for "Spherical" style
let Aura_Array = [
  'rgba(255, 0, 111,0.01)',
  'rgba(0, 255, 208,0.01)',
  'rgba(45, 204, 24,0.01)',
  'rgba(255, 111, 0,0.01)',

];


function setup() {

  // Setting the default style to card 1
  localStorage.setItem('Style',1);

  // Creating Canvas
  Canvas_Width = 2000;
  Canvas_Height = 1000;
  Visualizer_Canvas = createCanvas(Canvas_Width, Canvas_Height);

  // Grabbing microphone input
  Microphone_Input = new p5.AudioIn();
  Microphone_Input.start();

  // Evaluating the Fast Fourier Transform (FFT) of the microphone input
  fft = new p5.FFT();
  fft.setInput(Microphone_Input);

}

// Setting the properties/style of the graph bars
let Bar_Width = 10;
let Bar_Radius = 20;
var Number_Of_Bars = 80;
var Random_Colour_Index = 1;

function draw() {

    // Returns the frequency magnitudes ranging from 0-255
    let Spectrum_Values = fft.analyze(128);

    // Position of the first bar
    var X_Position = 0;
    var Y_Position = 345;
    var X_Position_Alias = 0;

    // Spacing parameters
    let Spacing = 10;
    let Gain = 1.2;
    var Position_Incrementer = Spacing + Bar_Width;
    var Degree_Start = 0;
    var Degree_Interval = 360/Number_Of_Bars;

    // Grabbing the signal "style" and "Changed_Flag"
    var Style_Index = localStorage.getItem('Style');
    var Changed_Flag = localStorage.getItem('Changed_Flag');

    // Setting window position and size depending on style type
    if(Changed_Flag == 1){
      const {remote} = require('electron');
      const Main_Window = remote.getCurrentWindow();
      const display = remote.screen.getPrimaryDisplay();
      const Screen_Size = display.workAreaSize;

      if(Style_Index == 1){
      Visualizer_Canvas.clear();
      let height = 350;
      let width = Screen_Size.width;
      let animate = false;
      var x = 0;
      var y = Screen_Size.height - 320;

      Main_Window.setPosition(x,y,animate);
      Main_Window.setSize(width, height, animate);
      console.log("Display");
      localStorage.setItem('Changed_Flag',0);

    }

    if(Style_Index == 2){
      Visualizer_Canvas.clear();
      let height = 350;
      let width = Screen_Size.width;
      let animate = false;
      var x = 0;
      var y = Screen_Size.height - 320;

      Main_Window.setPosition(x,y,animate);
      Main_Window.setSize(width, height, animate);
      console.log("Display");
      localStorage.setItem('Changed_Flag',0);
    }

    if(Style_Index == 3){
      Visualizer_Canvas.clear();
      let height = 600;
      let width = 600;
      let animate = false;
      let Horizontal_Midpoint = (Screen_Size.width/2)-(width/2);
      let Vertical_Midpoint =  Screen_Size.height/2;
      var x = Horizontal_Midpoint;
      var y = 200;

      Main_Window.setSize(width,height,animate);
      Main_Window.setPosition(x,y,animate);
      Main_Window.movable = true;
      localStorage.setItem('Changed_Flag',0);
    }

    if(Style_Index == 4){
      Visualizer_Canvas.clear();
      let height = 600;
      let width = 1000;
      let animate = false;
      let Horizontal_Midpoint = (Screen_Size.width/2)-(width/2);
      let Vertical_Midpoint =  Screen_Size.height/2;
      var x = Horizontal_Midpoint;
      var y = 200;

      Main_Window.setSize(width,height,animate);
      Main_Window.setPosition(x,y,animate);
      localStorage.setItem('Changed_Flag',0);

    }

    if(Style_Index == 5){
      Visualizer_Canvas.clear();
      let height = 600;
      let width = 1000;
      let animate = false;
      let Horizontal_Midpoint = (Screen_Size.width/2)-(width/2);
      let Vertical_Midpoint =  Screen_Size.height/2;
      var x = Horizontal_Midpoint;
      var y = 200;

      Main_Window.setSize(width,height,animate);
      Main_Window.setPosition(x,y,animate);
      localStorage.setItem('Changed_Flag',0);
    }

}



beginShape();
clear();

    for(Bar_Index = 0; Bar_Index < Number_Of_Bars; Bar_Index++){

    var Bar_Height = -Gain*Spectrum_Values[Bar_Index];

    // Default bar intensity style
    noStroke();
    colorMode(HSB);
    fill(Bar_Index,255,255,255,0.8);

    // Style: HSB color
    if(Style_Index == 1){
      colorMode(HSB);
      fill(Bar_Index,255,255,255,0.8);
      rect(X_Position, Y_Position, Bar_Width, Bar_Height, Bar_Radius);
      X_Position = X_Position + Position_Incrementer;
    }

    // Style: frost white
    if(Style_Index == 2){
      fill('rgba(255,255,255,0.7)');
      rect(X_Position, Y_Position, Bar_Width, Bar_Height, Bar_Radius);
      X_Position = X_Position + Position_Incrementer;
    }

    // Style: spherical
    if(Style_Index == 3){
      fill(Aura_Array[localStorage.getItem('Colour_Flag')]);
      arc(270 , 265 , -1*Bar_Height + 200, -1*Bar_Height + 200, 0, (360/360)*(2*PI));

      fill('rgba(255,255,255,0.05)');
      arc(270 , 265 , -1*Bar_Height + 100, -1*Bar_Height + 100, 0, (360/360)*(2*PI));

      fill('rgba(255,255,255,0.3)');
      stroke('rgba(255,255,255,0.3)');
      strokeWeight(3);

      Degree_End = Degree_Start + Degree_Interval;
      arc(270 , 265 , -1*Bar_Height + 200, -1*Bar_Height + 200, (Degree_Start/360)*(2*PI), (Degree_End/360)*(2*PI),PIE,2000);
      Degree_Start = Degree_Start + Degree_Interval;
    }

    // Style: waveform
    if(Style_Index == 4){
      stroke('rgba(255,255,255,0.3)');
      strokeWeight(3);
      fill('rgba(0, 255, 208,0)');
      Bar_Width_Alias = 15;
      Bar_Spacing_Alias = 1;
      Bar_Radius_Alias = 0;
      rect(X_Position_Alias, Y_Position-50, Bar_Width_Alias, Bar_Height + 5, Bar_Radius_Alias);
      rect(X_Position_Alias, Y_Position-50, Bar_Width_Alias, -1*Bar_Height + 5, Bar_Radius_Alias);
      X_Position_Alias = X_Position_Alias + Bar_Width_Alias + Bar_Spacing_Alias;
    }

    // Style: wireframe

    if(Style_Index == 5){
      fill('rgba(0, 255, 208,0.8)');
      Bar_Width_Alias = 15;
      Bar_Spacing_Alias = 1;
      Bar_Radius_Alias = 0;
      rect(X_Position_Alias, Y_Position-50, Bar_Width_Alias, Bar_Height + 5, Bar_Radius_Alias);
      rect(X_Position_Alias, Y_Position-50, Bar_Width_Alias, -1*Bar_Height + 5, Bar_Radius_Alias);
      X_Position_Alias = X_Position_Alias + Bar_Width_Alias + Bar_Spacing_Alias;
    }

    }

    endShape();

}

setInterval(function() {
var Random_Index = Math.floor(Math.random() * Aura_Array.length)
localStorage.setItem('Colour_Flag',Random_Index);
}, 7000);
