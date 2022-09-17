
/*
  The UI class is implemenented by Nuoxi Zhang on 2022/03/30. And uses TextWidget class implemented by Isioma and CheckBox
  class by Mykhailo Bitiutskyy. The inner class TextDisplay was implemented by Nuoxi Zhang
*/

class UI implements Widget
{
  public TextWidget fromTextWidget;
  public TextWidget countryTextWidget;
  public TextWidget toTextWidget;
  public TextWidget intervalTextWidget;
  ArrayList<CheckBox> boxes = new ArrayList<CheckBox>();
  ArrayList<CheckBox> chartSelection = new ArrayList<CheckBox>();
  CheckBox previousBox= new CheckBox();
  CheckBox previousSelection= new CheckBox();
  Button clearButton = new Button();
  Button enterButton = new Button();
  TextDisplay display = new TextDisplay();
  
  boolean isTextOutput = false;
  
  UI(int initialX, int initialY, int width, int height,
    String label, color widgetColor, PFont font, int event)
    {
      fromTextWidget = new TextWidget(initialX-150, initialY,  width, height, "1957 10 04", widgetColor, font, event);
      toTextWidget = new TextWidget(initialX, initialY,  width, height,   "2022 02 28", widgetColor, font, event);
      intervalTextWidget = new TextWidget(initialX-150, initialY-height-20, width, height, "Interval", widgetColor, font, event);
      countryTextWidget = new TextWidget(initialX, initialY-height-20,  width, height, "Country" , widgetColor, font, event);
      //label= null;
      countryTextWidget.getLabel();
    }
    
  /*void setCheckBoxes(ArrayList<CheckBox> input)
  {
    this.boxes = input;
  }*/
  void addTextDisplay(TextDisplay dis)
  {
    this.display = dis;
  }
  void addEnterButton(Button button)
  {
    this.enterButton = button;
  }
  void addClearButton(Button button)
  {
    this.clearButton = button;
  }
  void addCheckBox(UI.CheckBox box)
  {
    boxes.add(box);
    previousBox = boxes.get(0);
    previousBox.widgetColor = colourBlack; // by default Date check box is selected, but does't return event two
  }
  void addChartSelection(UI.CheckBox selection)
  {
    chartSelection.add(selection);
    previousSelection = chartSelection.get(0);
    previousSelection.widgetColor = colourBlack;
    
  }
  int checkBoxTicked(int mx, int my)
  {
    
    try
    {
      for( CheckBox box : boxes )
      {
        int event = box.getEvent(mx, my);
        if(event != EVENT_NULL)
        {
          /*previousBox.widgetColor = colourWhite;
          box.widgetColor = red;
          previousBox = box;
          return event;*/
          previousBox.widgetColor = colourWhite;
          previousBox.isTicked = false;
          box.widgetColor = red;
          box.isTicked = true;
          previousBox = box;
          return event;
        }
        
      }
    }catch(NullPointerException ex)
    {
      
    }
    return EVENT_NULL;
  }
  int checkChartTicked(int mx, int my)
  {
    
    try
    {
      for( CheckBox chart : chartSelection )
      {
        int event = chart.getEvent(mx, my);
        if(event != EVENT_NULL)
        {
          previousSelection.widgetColor = colourWhite;
          previousBox.isTicked = false;
          chart.widgetColor = red;
          chart.isTicked = true;
          previousSelection = chart;
          return event;
        }
        
      }
    }catch(NullPointerException ex)
    {
      
    }
    return EVENT_NULL;
  }
  
  void draw() // this draw() belongs to UI class
  {
    fromTextWidget.draw();
    toTextWidget.draw();
    countryTextWidget.draw();
    intervalTextWidget.draw();
    for(CheckBox chartSelect : chartSelection)
    {
      chartSelect.draw();
    }
    for(CheckBox box : boxes)
    {
      box.draw();
    }
    enterButton.draw();
    clearButton.draw();
    display.draw();
    
    fill(colourWhite);
    text("From:", 305, 725);
    text("To:", 475, 725);
    text("Interval:", 305, 675);
    text("Country:", 453, 675);
  }
  
  
  
  
  
  
  
  
  
  class TextWidget
  {
    int x, y, width, height;
    String label = " "; 
    int event;
    color widgetColor, labelColor;
    PFont widgetFont;
    int maxlen = 20;
    // Default constructor 
    TextWidget()
    {
      
    }
    TextWidget(int x, int y, int width, int height,
    String label, color widgetColor, PFont font, int event)
    {
      this.x=x; 
      this.y=y; 
      this.width = width; 
      this.height= height; 
      this.label=label; 
      this.event=event; 
      this.widgetColor= widgetColor; 
      this.widgetFont= font;
      labelColor = color(0);
    }
    
    void append(char s)
    {
      if(s == BACKSPACE)
      {
        if(!label.equals(""))
        {
          label=label.substring(0,label.length()-1);
        }
      }
      else if (label.length() <maxlen)
        label=label+str(s);
    }
    
    String getLabel()
    {
      if(label.length() != 0)
        return this.label;
      else return "Invalid Input";
    }
    
    int getEvent(int mX, int mY)
    {
      if(mX>x && mX < x+width && mY >y && mY <y+height){
         return event;
      }
      return EVENT_NULL;
    }
    
    
    void draw(color border){
      stroke(border);
      fill(widgetColor);
      rect(x,y,width,height);
      fill(labelColor);
      text(label, x+10, y+height-10);
      
    }
     void draw(){
      noStroke();
      fill(widgetColor);
      rect(x,y,width,height);
      fill(labelColor);
      text(this.label, x+10, y+height-10);
     
    }
  }
  //Class implemented by Mykhailo Bitiutskyy on 30/03/2022
  class CheckBox
  {
    int x, y, width, height;
    String label; 
    int event;
    color widgetColor, labelColor;
    PFont widgetFont;
    private boolean isTicked = false;
    CheckBox()
    {
      
    }
    CheckBox(int x, int y, int width, int height,
    String label, color widgetColor, PFont font, int event){
      this.x=x; 
      this.y=y; 
      this.width = width; 
      this.height= height;
      this.label = label; this.event = event; 
      this.widgetColor= widgetColor; 
      this.widgetFont= font;
      labelColor = color(0);
    }
    void setTicked(boolean input)
    {
      this.isTicked = input;
    }
    int getEvent(int mX, int mY)
    {
      if(mX>x && mX < x+width && mY >y && mY <y+height){
         return event;
      }
      return EVENT_NULL;
    }
    void displayX()
    {
      beginShape();
      stroke(colourWhite);
      line(x,y, x+width, y+height);
      line(x+width, y, x, y+height);
      endShape();
    }
    
    
    void draw()
    { 
      if(isTicked)
        text("X", x+10, y+10);
      noStroke();
      fill(widgetColor);
      rect(x,y,width,height);
      text(label, x+width+10,  y+(height/2));
    } 
  }
  //This inner class was implemented by Nuoxi Zhang on 2022/04/01
  class TextDisplay
  {
    int x, y, width, height;
    int event;
    color widgetColor, labelColor;
    PFont widgetFont;
    //private boolean errorMessageExist = false;
    String guide, error;
    TextDisplay()
    {
      
    }
    TextDisplay(int x, int y, int width, int height,
    String guide, String error,  color widgetColor, PFont font, int event){
      this.x=x; 
      this.y=y; 
      this.width = width; 
      this.height= height;
      this.guide = guide;
      this.event = event; 
      this.error = error;
      this.widgetColor= widgetColor; 
      this.widgetFont= font;
      labelColor = color(0);
    }
    
    void draw()
    {
      // by default this.errorMessage will be "" when there is no error message
      // this eliminated the need of a boolean variable
      
      fill(colourWhite);
      rect( x, y, width, height);
      fill(colourBlack);
      text(this.guide, x+5, y+20);
      fill(#ff0000); // colour red
      text(this.error, x+5, y + height - 20);
    }
  }
}
