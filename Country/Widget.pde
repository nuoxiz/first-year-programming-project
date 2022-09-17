
interface Widget{}


// class implemented by Liam Zone 23/03/2022
abstract class abstractWidget {
  int x, y, width, height;
  String label; 
  int event;
  color widgetColor, labelColor;
  PFont widgetFont;

  abstractWidget(int x,int y, int width, int height, String label, 
  color widgetColor, color labelColor, PFont widgetFont, int event){
    this.x=x; 
    this.y=y; 
    this.width = width; 
    this.height= height;
    this.label=label; this.event=event; 
    this.widgetColor=widgetColor; 
    this.widgetFont=widgetFont;
    labelColor = color(0);
   } 
   abstractWidget(){}
   
   void updateColor (color newColor){
    widgetColor = newColor;
  }
  
  //code from week 6, removed 23/03/2022 by Liam Zone
  /*
  color hover(int mX, int mY){
     if(mX>x && mX < x+width && mY >y && mY <y+height){
       return color (255); 
     }
     return color(0);
  }
  */
  
  int getEvent(int mX, int mY){
     if(mX>x && mX < x+width && mY >y && mY <y+height){
        return event;
     }
     return EVENT_NULL;
  }
  
  void drawSub(){
  
  }
  
  
  
  void draw(color border){
    stroke(border);
    fill(widgetColor);
    rect(x,y,width,height);
    fill(labelColor);
    text(label, x+width/15, y+height-height/5*2);
    drawSub();
    
  }
   void draw(){
    noStroke();
    fill(widgetColor);
    rect(x,y,width,height);
    fill(labelColor);
    text(label, x+width/15, y+height-height/5*2);
    drawSub();
  }
}

class scrollBarButton extends abstractWidget implements Widget{
  
  String tabTitle;
  boolean isClicked;
  
  public scrollBarButton (int x,int y, int width, int height, String buttonTitle, color widgetColor, color labelColor, PFont widgetFont, int ScreenID, boolean vert, boolean optionDirection){
    super(x, y, width, height, buttonTitle, widgetColor, labelColor, widgetFont, ScreenID);
    if (vert == true){
      if (optionDirection == true){
        label = "^";
      } else {
        label = "v";
      }
    } else {
      if (optionDirection == true){
        label = ">";
      } else {
        label = "<";
      }
    }
  }
  
  color hover(int mX, int mY){
     if(mX>x && mX < x+width && mY >y && mY <y+height){
       return color (200, 255, 255); 
     }
     return color(255);
  }
  
  @Override // Liam zone
  void draw(){
    noStroke();
    fill(hover(mouseX, mouseY));
    rect(x,y,width,height);
    fill(labelColor);
    text(label, x+width/2 - 3, y+height-height/5*2);
    drawSub();
  }
  
}

// rudimentry
class Tab extends abstractWidget implements Widget{
  
  boolean currentTab; //use to highlight current tab;
  int offsetX = 0;
  
  public Tab (int x,int y, int width, int height, String tabTitle, color widgetColor, color labelColor, PFont widgetFont, int ScreenID){
    super(x, y, width, height, tabTitle, widgetColor, labelColor, widgetFont, ScreenID);
  }
  
  int getScreen(int mX, int mY){
    if (x + offsetX + width >= 80 && x + offsetX <= SCREENWIDTH - 70){
      if(mX>x+offsetX && mX < x+width+offsetX && mY >y && mY <y+height ){
        if (x + offsetX + width >= 80 && x + offsetX + width - (width/8) <= SCREENWIDTH - 70 && event != 0){
          if(mX>x+width - (width/8)+offsetX && mX < x+width+offsetX && mY >y && mY <y+height){
             return SCREEN_DELETE;
          }
        } 
         
         return event;
      }
    } 
    return SCREEN_NULL;
  }
  void setScreenID(int event){
    this.event = event;
  } 
  
  void applyOffset(int offset){
    offsetX += offset;
  }
  
  void resetOffset(){
    offsetX = 0;
  }
  
  @Override // Liam zone
  void draw(){
    noStroke();
    if (screenList.get(event).isActive() == true){
      fill(200,255,255);
    } else {
      fill(widgetColor);
    }
    rect(x+offsetX,y,width,height);
    fill(labelColor);
    text(label, x+width/15 +offsetX, y+height-height/5*2);
    drawSub();
  }
  @Override // Liam zone
  void drawSub(){
    if (screenList.size() >1 && event != 0){
      fill (205,0,0);
      rect (x+width - (width/8) +offsetX, y, (width/8), height);
      fill (255);
      text("x", x+width-9 +offsetX, y+height-15);
    }
    
  }
  
}


class Button extends abstractWidget implements Widget{
 
  
  public Button (int x,int y, int width, int height, String tabTitle, color widgetColor, color labelColor, PFont widgetFont, int ScreenID){
    super(x, y, width, height, tabTitle, widgetColor, labelColor, widgetFont, ScreenID);
  }
  Button()
  {
    
  }
  
}

class TextWidget extends abstractWidget
{
  int x;
  int y;
  int width;
  int height;
  String label;
  int event;
  color widgetColor;
  color labelColor;
  PFont widgetFont;
  TextWidget(int x, int y, int width, int height, String label, color widgetColor, PFont widgetFont, int event) {
    widgetFont = stdFont;
    this.x=x;
    this.y=y;
    this.width = width;
    this.height= height;
    this.label=label;
    this.event=event;
    this.widgetColor=widgetColor;
    this.widgetFont=widgetFont;
    labelColor= color(0);
  }

  void draw() {
    fill(widgetColor);
    rect(x, y, width, height);
    fill(labelColor);
    textFont(widgetFont);
    text(label, x+10, y+height-10);
  }
  int getEvent1(int mX, int mY) {
    if (mX>x && mX < x+width && mY >y && mY <y+height) {
      return event;
    }
    return EVENT_NULL;
  }
}
/*class TextWidget extends abstractWidget implements Widget
{
  int x, y, width, height;
    String label = " "; 
    int event;
    color widgetColor, labelColor;
    PFont widgetFont;
    int maxlen = 20;
    // Default constructor 
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
  
}*/


/*class CheckBox extends abstractWidget
{
  CheckBox(int x, int y, int width, int height,
  String label, color widgetColor, PFont font, int event){
    super(x, y, width, height, label, widgetColor, widgetColor, font, event);
  }
  @Override
  void draw()
  {
    rect(x, y, width, height);
    text(label, x+width+10, y+(height/2));
    
  }
  
  
}*/
