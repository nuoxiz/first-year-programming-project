/*
  This class is implemented by Nuoxi Zhang on 2022/03/29.
  All the methods are inplmented by Nuoxi Zhang on 2022/03/29.
*/
class LineChart implements Chart{
  
  final ArrayList<Integer> data;
  float initialX, initialY, interval;
  String title = "Invalid Title"; // in case of some invalid inputs / future overloading
  final ArrayList<String> labels; 
  private float scaleFactor = 2;
  private float diameterOfCircle = 7;
  private float marginWidth;
  private float labelMarginDistance = 20;
  String currentEvent = "";
  LineChart (String title, ArrayList<Integer> data, float xpos, float ypos, float xInterval, ArrayList<String> labels){
    this.data = (ArrayList<Integer>)data.clone();
    this.initialX = xpos;
    this.initialY = ypos;
    this.interval = xInterval;
    this.title = title;
    this.marginWidth = xpos + (xInterval * data.size());
    this.labels = (ArrayList<String>) labels.clone(); 
                         
  }
  LineChart (String title, ArrayList<Integer> data, float xpos, float ypos, float xInterval, ArrayList<String> labels,
  int scale){
    this.data = (ArrayList<Integer>)data.clone();
    this.initialX = xpos;
    this.initialY = ypos;
    this.interval = xInterval;
    this.title = title;
    this.marginWidth = xpos + (xInterval * data.size());
    this.labels = (ArrayList<String>) labels.clone(); 
    this.scaleFactor = scale;                  
  }
// provide other class the ability to modify the scaleFactor.
void setScaleFactor(float newFactor)
{
  this.scaleFactor = newFactor;
}
void drawLineGraph(ArrayList<Integer> list, float initialX, float initialY, float interval, float circleDiameter, float scale)
{
  int distanceBetweenCircleAndDate = 20;
  beginShape();
  noFill();
  stroke(#00ff00);
  curveTightness(0.5);
  curveVertex(initialX, initialY);
  for( int i = 0; i < list.size(); i++ )
  {
    Integer yValue = list.get(i);
    ellipse(initialX, initialY-(yValue/scale), circleDiameter, circleDiameter); // draw the circle
    curveVertex(initialX, initialY - (yValue/scale)); // use minus sign so that the graphs is upright
    text(this.labels.get(i), initialX, initialY + labelMarginDistance);
    text(yValue, initialX, initialY - abs(yValue/scale)- distanceBetweenCircleAndDate); // display label
    initialX += interval;
    
  }
  curveVertex(initialX, 0);
  endShape();
} 
  void setEventLegend(String str)
  {
    this.currentEvent = str;
  }
  /*
    This method was implemented by Nuoxi Zhang on 2022/04/10 to display the legend of the graph
  */
  void displayLegend()
  {
    String unit = "";
    if(currentEvent.equalsIgnoreCase("diameter")) unit = "M";
    if(currentEvent.equalsIgnoreCase("mass")) unit = "KG";
    if(currentEvent.equalsIgnoreCase("date")) unit = "Year";
    if(currentEvent.equalsIgnoreCase("apogee") || currentEvent.equalsIgnoreCase("perigee")) unit = "KM";
    fill(colourWhite);
    text("Y-Axis: Frequency", SCREENWIDTH - 200, DEFAULT_Y_COORDINATE_OF_CHART_TITLE);
    text("X-Axis: "+ currentEvent + "(" + unit + ")", SCREENWIDTH - 200, DEFAULT_Y_COORDINATE_OF_CHART_TITLE + 20 );
  }

  @Override
  void draw (){
    drawLineGraph(data, initialX, initialY, interval, diameterOfCircle, scaleFactor);
    drawContainer(title);
    drawMargin(this.initialX+5, this.initialY, 400, this.marginWidth);
    displayLegend();
  }
}
