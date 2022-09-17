// class implemented by Liam Zone 23/03/2022
class BarChart implements Chart{
  
  final ArrayList<Bar> bars;
  String title = "Invalid Title"; // in case of some invalid inputs / future overloading
  private float marginWidth; // This field is added by Nuoxi Zhang on 29/03/2022
  String currentEvent = "";
  
  //Bar firstBar;
  //empty bar chart
  BarChart (ArrayList<Bar> bars, String title){
    this.bars = bars;
    this.title = title;
  }

  // generates bar arraylist with constructor
  BarChart (String title, ArrayList<Integer> data, float xpos, float ypos, float barWidth, ArrayList<String> labels){
  
    if (data != null && labels != null){
      bars = generateBars(data, xpos, ypos, barWidth, labels);
    this.title = title;
    //marginWidth = xpos + (barWidth*bars.size()); // adaptation of the width of the margin at the bottom
    marginWidth = xpos + (barWidth*bars.size()) + (DISTANCE_BETWEEN_BARS*bars.size()); // added by Nuoxi Zhang on 2022/04/10
    } else {
      println("Error: NullPointerException, data null in BarChart Constructor");
      data = new ArrayList<Integer>();
      labels = new ArrayList<String>();
      data.add(-5);
      labels.add("Error: No data provided");
      bars = generateBars(data, xpos, ypos, barWidth, labels);
      this.title = title;
      marginWidth = xpos + (barWidth*bars.size()) + (DISTANCE_BETWEEN_BARS*bars.size()); // adaptation of the width of the margin at the bottom
    }
    
    //firstBar = bars.get(0);
  }
  
  
  //overload to accept scale factor
  BarChart (String title, ArrayList<Integer> data, float xpos, float ypos, float barWidth, ArrayList<String> labels, int scaleFactor){
     
    if (data != null && labels != null){
      bars = generateBars(data, xpos, ypos, barWidth, labels, scaleFactor);
      //marginWidth = xpos + (barWidth*bars.size());
      marginWidth = xpos + (barWidth*bars.size()) + (DISTANCE_BETWEEN_BARS*bars.size()); // added by Nuoxi Zhang on 2022/04/10
      this.title = title;
    } else {
      println("Error: NullPointerException, data null in BarChart Constructor");
      data = new ArrayList<Integer>();
      labels = new ArrayList<String>();
      data.add(-5);
      labels.add("Error: No data provided");
      bars = generateBars(data, xpos, ypos, barWidth, labels, scaleFactor);
      marginWidth = xpos + (barWidth*bars.size()) + (DISTANCE_BETWEEN_BARS*bars.size()); // added by Nuoxi Zhang on 2022/04/10
      this.title = title;
    }
    
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

  void setEventLegend(String str)
  {
    this.currentEvent = str;
  }
  
  ArrayList<Bar> getBar()
  {
    return this.bars;
  }
  
  @Override
  void draw (){
    drawBars(bars);
    drawContainer(title); // consolidated into 1 function
    if (bars.size() >=1){
      drawMargin(bars.get(0).xpos+7, bars.get(0).ypos, 400, this.marginWidth); // added by Nuoxi Zhang on 29/03/2022.
    }
    displayLegend();
  }
}
