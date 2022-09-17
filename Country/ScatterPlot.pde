// class implementation done by Liam Zone
// EMPTY CLASS FOR NOW -- Will implement this class using 2 sets of data. Will take some work to deal with excessive data. Might create an array equal to the size of the screen/pixels alloted);
class ScatterPlot implements Chart{
  
  final ArrayList<Integer> dataX;
  final ArrayList<Integer> dataY;
  float initialX, initialY, interval;
  String title = "Invalid Title"; // in case of some invalid inputs / future overloading
  final ArrayList<String> labelsX; 
  final ArrayList<String> labelsY;
  
  private float scaleFactor = 2;
  private float diameterOfPoint = 7;
  private float marginWidth;
  private float labelMarginDistance = 20;
  
  private float intervalX;
  private float intervalY;
  
  private float pixelPerPoint = 10;
  
  
  private int baseOffset = 20;
  
  ScatterPlot(){
    dataX = null;
    dataY = null;
    marginWidth = 10;
    labelsY = null;
    labelsX = null;
  }
  
  
  ScatterPlot(String title, ArrayList<Integer> dataX, ArrayList<Integer> dataY, float xpos, float ypos, ArrayList<String> labelsX, ArrayList<String> labelsY, int scaleFactor, int pixelPerPoint){
    this.dataX = dataX;
    this.dataY = dataY;
    this.labelsX = labelsX;
    this.labelsY = labelsY;
    this.pixelPerPoint = pixelPerPoint; // might make this dependent on # of labels (or not idk, dates will be hard);
    this.initialX = xpos + baseOffset;
    this.initialY = ypos;
    if (title != null){
      this.title = title;
    }
    
  }
    
    
    ScatterPlot(String title, ArrayList<Integer> dataX, ArrayList<Integer> dataY, float xpos, float ypos, ArrayList<String> labelsX, ArrayList<String> labelsY, int scaleFactor, int pixelPerPoint, String axisTitleX, String axisTitleY, int intervalX, int intervalY){
    this.dataX = dataX;
    this.dataY = dataY;
    this.labelsX = labelsX;
    this.labelsY = labelsY;
    this.pixelPerPoint = pixelPerPoint; // might make this dependent on # of labels (or not idk, dates will be hard);
    this.initialX = xpos + baseOffset;
    this.initialY = ypos;
    this.scaleFactor = scaleFactor;
    this.intervalX = intervalX;
    this.intervalY = intervalY;
    
    if (title != null){
      this.title = title;
    }  
    
    
    // have it so that the interal is seprate for the x and y, have -1 be a special code to recognize that this axis is for countries. 
    
    
  }
  
  // will remove datapoints ouside of the range / graph of the scatterplot
  void removeDataPoints(){
    for (int i = 0; i <= dataX.size(); i++){
      int x = dataX.get(i);
      if (initialX + (x/intervalX) > SCREENWIDTH - 20){
        dataX.remove(i);
        dataY.remove(i);
      }
      
    }
    for (int i = 0; i <= dataY.size(); i++){
      int y = dataY.get(i);
      if (initialY-(y/intervalY) > SCREENWIDTH - 20){
        dataX.remove(i);
        dataY.remove(i);
      }
      
    }
  }
  
  void drawScatter(){
    for( int i = 0; i < dataX.size(); i++ )
    {
      
      float xValue = dataX.get(i);
      float yValue = dataY.get(i);
      
      if (( mouseX >= int(initialX+(xValue/intervalX)) - 4 && mouseX <= int(initialX+(xValue/intervalX)) + 4) && (mouseY >= int(initialY - (yValue/intervalY)) -4 && mouseY <= int(initialY - (yValue/intervalY)) + 4 )){
        //println("hello");
        fill(50);
        rect(initialX+(xValue/intervalX), initialY - (yValue/intervalY)-25, 60 + 10 *( ("(" + int(xValue) + ", " + int(yValue) +")").length() -8), 25);
        fill(255);
        text("(" + int(xValue) + ", " + int(yValue) +")", initialX+(xValue/intervalX)+5, initialY - (yValue/intervalY) - 7);
      }
      
      fill(255);
      ellipse(initialX+(xValue/intervalX), initialY-(yValue/intervalY), 4, 4); // draw the circle
      
      //text(int(yValue), initialX, ); // display label
      
      //initialX += interval;
    }
  }
  
  
 void drawBackground(){
    //stroke(0);
    //rect(17, 100, SCREENWIDTH-35, 400);
    for(int i = 0; i <= SCREENWIDTH-35; i+=intervalX*pixelPerPoint){
      stroke(100);
      line (17 + i + baseOffset, 100, 17+i + baseOffset, 499);
      text(int((int(i)*intervalX)), i + baseOffset, initialY + labelMarginDistance);
    }
    int countY = 0;
    for(int i = 0; i <= 399; i+=intervalY*pixelPerPoint){
      
      stroke(100);
      line (17 + baseOffset, 499-i, SCREENWIDTH-20, 499-i);
      text(int((int(i)*intervalY)), initialX - 5 - baseOffset, 499 - (i - 5)); // display label
    }
  }
  
  void drawData(){
    
  }

  void draw(){
    drawBackground();
    drawContainer(title);
    drawScatter();
  }
}
