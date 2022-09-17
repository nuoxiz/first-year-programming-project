/*
  This class is implemented by Nuoxi Zhang on 2020/03/18. 
  The Bar class represent each individual bar in a barchart. A barchart is implemented as an ArrayList of Bar.
  The core of Bar class is that its instance contain an object of PShape class which represent the actual bar.
  The class still needs imporvement and need to disuss with the group as at 2020/03/18.
*/


class Bar
{
  float xpos, ypos,barWidth;
  final String label;
  int value;
  PShape shape;
  
  // Value Changed to 100 for ease of viewing - Liam Zone 21/03/2022
  int scaleFactor = 100; 
  Bar(float x, float y, int val, float barWidth, String text, int scaleFactor)
  {
    this.xpos = x;
    this.ypos = y;
    this.value = val;
    this.label = text;
    this.barWidth = barWidth;
    this.shape = createShape(RECT, xpos, ypos, barWidth, -(value/scaleFactor));
    shape.setFill(#00FF00);
    this.scaleFactor = scaleFactor;
    
  }
  Bar(float x, float y, int val, float barWidth, String text)
  {
    this.xpos = x;
    this.ypos = y;
    this.value = val;
    this.label = text;
    this.barWidth = barWidth;
    this.shape = createShape(RECT, xpos, ypos, barWidth, -(value/scaleFactor));
    shape.setFill(#00FF00);
  }
  Bar()
  {
    this.label = "";
  }

}
