

// class implemented by Liam Zone 23/03/2022
// This class functions as the whole screen apart from the tabs. The tabs exist separately from this.
class Screen{
  
  
  color background;
  ArrayList searchWidget= new ArrayList();
  ArrayList<Tab> tabList; // list of all tabs that the user can switch too.
  ArrayList<Chart> Charts; // contains all BarCharts
  String ScreenTitle = "Empty";
  ArrayList<abstractWidget> checkBoxes;
  String in;
  /*
    At some point adapt this into either having an ArrayList for all types of charts, 
    or have seprate arrayLists for each type.
  */
  boolean active = false; // boolean states if screen is current screen
  color widgetColor = color (255);
  
 
  // The following constructor is written by Nuoxi Zhang
  
  /*Screen(color background, boolean isActive, Chart Chart, String ScreenTitle,
  TextWidget from, TextWidget to, TextWidget country)
  {
    this.background = background;
    tabList = new ArrayList<Tab>();
    //tabList = new ArrayList<abstractWidget>();
    active = isActive;
    Charts = new ArrayList<Chart>();
    if (Chart != null){
      Charts.add(Chart);
    } else {
      println("Error: No Chart Provided to Constructor");
    }
    this.ScreenTitle = ScreenTitle;
    textWidgetFrom = from;
    textWidgetTo = to;
    textWidgetCountry = country;
  }
  
  Screen(color background, boolean isActive, Chart Chart, String ScreenTitle,
  TextWidget from, TextWidget to,TextWidget country, CheckBox box)
  {
    this.background = background;
    tabList = new ArrayList<Tab>();
    //tabList = new ArrayList<abstractWidget>();
    active = isActive;
    Charts = new ArrayList<Chart>();
    if(Chart != null){
      Charts.add(Chart);
    } else {
      println("Error: No Chart Provided to Constructor");
    }
    
    this.ScreenTitle = ScreenTitle;
    textWidgetFrom = from;
    textWidgetTo = to;
    textWidgetCountry = country;
    checkBoxes = new ArrayList<abstractWidget>();
    checkBoxes.add(box);
  }*/
  
  
  
  
  // basic constructor
  Screen(color background, boolean isActive){
    this.background = background;
    tabList = new ArrayList<Tab>();
    active = isActive;  
  }
  
  // prototype constructor for if barchart is passed in via constructor  
  Screen(color background, boolean isActive, Chart Chart, String ScreenTitle){
    this.background = background;
    tabList = new ArrayList<Tab>();
    active = isActive;
    Charts = new ArrayList<Chart>();
    if(Chart != null){
      Charts.add(Chart);
    } else {
      println("Error: No Chart Provided to Constructor");
    }
    this.ScreenTitle = ScreenTitle;
  }
  Screen(color background, boolean isActive, String ScreenTitle){
    this.background = background;
    tabList = new ArrayList<Tab>();
    active = isActive;
    Charts = new ArrayList<Chart>();
    this.ScreenTitle = ScreenTitle;
  }
  // gets title of screen
  String getTitle (){
    return ScreenTitle;
  }
  // sets title of screen
  void setTitle (String ScreenTitle){
    this.ScreenTitle = ScreenTitle;
  }
 
   // checks if screen is currently actively being displayed
  boolean isActive(){
    if (active) {
      return true;
    }
    return false;
  }
  
  // sets screen to active
  void setActive(boolean set){
    active = set;
  }
 
  // gets event ID for actions (in need of minor revamp)
  int getEvent(int x,int y){  
    int event;
    for(int i = 0; i<tabList.size(); i++){
      Tab aTab = (Tab) tabList.get(i);
      event = aTab.getEvent(x,y);
      if (event != EVENT_NULL){
        return event;
      }     
    }
    return EVENT_NULL;  
  }
  
  // unused switch function 
  void switchScreen(Screen newScreen){
    setActive(false);
    newScreen.setActive(true);
  }
    void addWidget(TextWidget widget) {
    searchWidget.add(widget);
  }
  void drawWigdet(TextWidget widget){
    for (int i=0; i<searchWidget.size(); i++) {
       widget=(TextWidget)searchWidget.get(i);
       widget.draw();
    }
  }
  
  
  int getEvent1(int x, int y) {
    int getE = 0;
    
    for(int index = 0; index < searchWidget.size(); index++) {
       TextWidget widget=(TextWidget)searchWidget.get(index);
       int event = widget.getEvent1(x, y);
      if(event > 0) {
        getE = event;
      }
    }
    return getE;
  }
  
  // draw
   void draw(){
    background (background);
    fill (widgetColor);
    
    for (Chart chart : Charts){
      chart.draw(); 
    }
    //The following for loop is implemented by Nuoxi Zhang on 2022/03/24
    
    /*for(abstractWidget box : checkBoxes)
    {
      box = (CheckBox)box;
      box.draw();  
    }*/
  }
}
