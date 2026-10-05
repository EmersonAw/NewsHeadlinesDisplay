PFont intertight;
PFont intertightItalic;

  // frames per second
int fps = 24;
String[] headlines = {
  
  // replace headlines here
    "BREAKING NEWS",
    "BREAKING NEWS"
   
    
};

// change date and time
String displaydate = "Sunday, May 24";
int startHour = 12;
int startMinute = 00;
int startSeconds = 00;

String singleLongHeadline = "";
float headlineX = 270; 


int frame = 0;
int opacity = 0;
// set endframe
int endframe = 1440;

// render. Saves images in the output. Set it to true to save images.
boolean render = false;


void setup() {
  pixelDensity(2);
  size(1920, 140); 
  frameRate(fps);

  
  intertight = createFont("fonts/InterTight.ttf", 32);
  intertightItalic = createFont("fonts/InterTight-Italic.ttf", 32);
  
  for (int i = 0; i < headlines.length; i++) {
    singleLongHeadline += headlines[i];
    if (i < headlines.length - 1) {
      singleLongHeadline += "   •   "; 
    }
  }
}

void draw() {
  background(#00ff00);  
  
  int elapsedSeconds = int(millis() / 1000.0) + (startHour * 3600) + (startMinute * 60) + startSeconds;
  int displayHour = (elapsedSeconds / 3600) % 24;
  int displayMinute = (elapsedSeconds / 60) % 60;
  String displayTime = nf(displayHour, 2) + ":" + nf(displayMinute, 2);

  fill(#cc2929);
  stroke(0);
  strokeWeight(4);
  rect(260, 100, 1660, 40);

  fill(255);
  textFont(intertightItalic);
  textSize(22);
  textAlign(LEFT, CENTER);
  text(singleLongHeadline, headlineX, 120); 
  
  fill(#00349e);  
  stroke(0);
  strokeWeight(4);
  rect(0, 0, 260, 140);
  
  fill(255);
  textAlign(LEFT, BASELINE); 
  textFont(intertightItalic);
  textSize(28);
  text(displaydate, 21, 38); 

 
  
  textFont(intertight);
  textSize(84);
  text(displayTime, 23, 116);

  headlineX -= 5.0; 
  
  fill(#00349e);  
  stroke(0);
  strokeWeight(4);
  rect(1800, 60, 120, 40);

  opacity = int(map(sin(frame * 0.1), -1, 1, 0, 255));
  
  fill(#cc2929, opacity);
  stroke(0);
  strokeWeight(0);
  ellipse(1820, 81, 20, 20);

  fill(255);
  textFont(intertightItalic);
  textSize(24);
  text("LIVE", 1847, 90);

  if (frameCount >= endframe) {
    noLoop(); 
  }
 
  if (render){
  saveFrame("output/frame-####.png"); 
  }
  frame++;
  
}
