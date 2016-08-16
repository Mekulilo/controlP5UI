import controlP5.*;

ControlP5 cp5;


ColorPicker cp;


int myColorBackground = color(0,0,0);
int knobValue = 100;

Knob myKnobA;
Knob myKnobB;

public float numberboxValue = 100;


int myColor = color(70,130,180);

int sliderValue = 100;
int sliderTicks1 = 100;
int sliderTicks2 = 30;
Slider abc;
Slider2D s;


Textarea myTextarea;

int c = 0;

Println console;

Chart myChart;


int blue =0;
int frame =0;
float x;
float y;
float easing = 1.98;

void setup() {
  size(640, 360);
   smooth();
  noStroke();  
  frameRate(100);
  cp5 = new ControlP5(this);
  
   cp = cp5.addColorPicker("picker")
          .setPosition(60, 100)
          .setColorValue(color(255, 128, 0, 128))
          ;
  
   myKnobA = cp5.addKnob("knob")
               .setRange(0,255)
               .setValue(50)
               .setPosition(100,70)
               .setRadius(50)
               .setDragDirection(Knob.VERTICAL)
               ;
                     
  myKnobB = cp5.addKnob("knobValue")
               .setRange(0,255)
               .setValue(220)
               .setPosition(100,210)
               .setRadius(50)
               .setNumberOfTickMarks(10)
               .setTickMarkLength(4)
               .snapToTickMarks(true)
               .setColorForeground(color(255))
               .setColorBackground(color(0, 160, 100))
               .setColorActive(color(255,255,0))
               .setDragDirection(Knob.HORIZONTAL)
               ;
  
    cp5.addIcon("icon",10)
     .setPosition(100,100)
     .setSize(70,50)
     .setRoundedCorners(20)
  
     .setFontIcons(#00f205,#00f204)
     //.setScale(0.9,1)
     .setSwitch(true)
     .setColorBackground(color(28,188))
     .hideBackground()
     ;  
  
  cp5.addNumberbox("numberbox")
     .setPosition(100,160)
     .setSize(100,20)
     .setScrollSensitivity(1.1)
     .setValue(50)
     ;
  

  cp5.addNumberbox("numberboxValue")
     .setPosition(100,220)
     .setSize(100,20)
     .setRange(0,200)
     .setMultiplier(0.1) // set the sensitifity of the numberbox
     .setDirection(Controller.HORIZONTAL) // change the control direction to left/right
     .setValue(100)
     ;
  
    s = cp5.addSlider2D("wave")
         .setPosition(30,40)
         .setSize(100,100)
         .setMinMax(20,10,100,100)
         .setValue(50,50)
         //.disableCrosshair()
         ;
         

  
  
  cp5.addFrameRate().setInterval(10).setPosition(0,height - 10);
    myChart = cp5.addChart("dataflow")
               .setPosition(50, 50)
               .setSize(200, 100)
               .setRange(-20, 20)
               .setView(Chart.LINE) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
               .setStrokeWeight(1.5)
               .setColorCaptionLabel(color(40))
               ;

  myChart.addDataSet("incoming");
  myChart.setData("incoming", new float[100]);
   cp5.setAutoDraw(false);
  
  cp5.addSlider("hello", 0, 100, 50, 40, 40, 100, 20);
  
  // enable the pointer (and disable the mouse as input) 
  cp5.getPointer().enable();
  cp5.getPointer().set(width/2, height/2);
  
   cp5.addSlider("sliderValue")
     .setPosition(100,50)
     .setRange(0,255)
     ;
      cp5.addSlider("sliderTicks1")
     .setPosition(100,140)
     .setSize(20,100)
     .setRange(0,255)
     .setNumberOfTickMarks(5)
     ;


  

  cp5.addSlider("sliderTicks2")
     .setPosition(100,370)
     .setWidth(400)
     .setRange(255,0) // values can range from big to small as well
     .setValue(128)
     .setNumberOfTickMarks(7)
     .setSliderMode(Slider.FLEXIBLE)
     ;
  

}
float cnt;


void draw() { 
  background(cp.getColorValue());
  fill(1,567);
  rect(50, 90, 275, 80);
  background(myColorBackground);
  fill(numberboxValue);
   rect(0,0,width,100);
   fill(knobValue);
  rect(0,height/2,width,height/2);
  fill(255,0,0);
  rect(80,40,140,320);
  
   background(sliderTicks1);

  fill(sliderValue);
  rect(0,0,width,100);
  
  fill(myColor);
  rect(0,280,width,70);
  
  fill(sliderTicks2);
  rect(0,350,width,50);
  

  myColor = color(myColor);
  println("a slider event. setting background to "+myColor);
  

  // when a value change from a ColorPicker is received, extract the ARGB values
  // from the controller's array value







    {
    




  
  
  
   background(cp5.get("hello").getValue());
  // first draw controlP5
  cp5.draw();
  
  // the draw our pointer
  cp5.getPointer().set(width - mouseX, height - mouseY);
  pushMatrix();
  translate(cp5.getPointer().getX(), cp5.getPointer().getY());
  stroke(255);
  line(-10,0,10,0);
  line(0,-10,0,10);
  popMatrix();
  println(cp5.isMouseOver());
  background(881);
  
    pushMatrix();
  translate(160,140);
  noStroke();
  fill(0,87);
  rect(0, -100, 400,200);
  strokeWeight(1);
  line(0,0,200, 0);
  stroke(255);
  
  for(int i=1;i<400;i++) {
    float y0 = cos(map(i-1,0,s.getArrayValue()[0],-PI,PI)) * s.getArrayValue()[1]; 
    float y1 = cos(map(i,0,s.getArrayValue()[0],-PI,PI)) * s.getArrayValue()[1];
    line((i-1),y0,i,y1);
  }

  myColorBackground = color(myColor);
  println("a numberbox event. setting background to "+myColor);
  
  
  popMatrix();
  
  background(blue);
  
  float targetX = mouseX;
  float dx = targetX - x;
  x += dx * easing;
  
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;
  
  line(10, 50, 90, 50);
  if (key == CODED) { 
    if (keyCode == UP) {
      y = 20;
    } else if (keyCode == DOWN) {
      y = 50;
    }
  } else {
    y = 35;
  }
  rect(25, y, 50, 30);
  
  if (mousePressed == true) {
    if (mouseButton == LEFT) {
      fill(88,92,0); // Black
    } else if (mouseButton == RIGHT) { 
      fill(255); // White
    }
  } else {
    fill(128,0,128); // Gray
  }
  rect(25, 25, 50, 50);
  
  ellipse(x, y, 66, 66);
  ellipse(mouseX, 16, 33, 33);   // Top circle
  ellipse(mouseX/2, 50, 33, 33); // Middle circle
  ellipse(mouseX*2, 84, 33, 33); // Bottom circle
  
  if (keyPressed == true) { // If the key is pressed,
    line(20, 20, 80, 80); // draw a line
  } else { // Otherwise,
    rect(40, 40, 20, 20); // draw a rectangle
     myChart.push("incoming", (sin(frameCount*0.1)*10));
     
    switch(key) {
    case('1'):myKnobA.setValue(180);break;
    case('2'):myKnobB.setConstrained(false).hideTickMarks().snapToTickMarks(false);break;
    case('3'):myKnobA.shuffle();myKnobB.shuffle();break;
  }  
     
     

  cp5.getPointer().pressed();
}


  cp5.getPointer().released();
  

  println("got an event for icon", 30);
  
    switch(key) {
    case('1'):
    // method A to change color
    cp.setArrayValue(new float[] {120, 0, 120, 255});
    break;
    case('2'):
    // method B to change color
    cp.setColorValue(color(255, 0, 0, 255));
    break; }
 
 }
}