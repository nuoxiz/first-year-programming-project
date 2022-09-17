class TabNavigator {
  ArrayList<Tab> tabList;
  int tabWidth = 125;
  int totalTabOffset = 0;
  int offsetSpeed;
  int maxOffset;

  
  scrollBarButton buttonLeft, buttonRight;
  
  TabNavigator(){
    tabList = new ArrayList<Tab>();
    buttonLeft = new scrollBarButton( 20, 10, 40, 40, "", color (255), color(255), stdFont, -6, false, false);
    buttonRight = new scrollBarButton( SCREENWIDTH - 60, 10, 40, 40, "", color (255), color(255), stdFont, -7, false, true);
  }
  
  Tab getTab(){// Liam zone
    int ScreenID;
    for(int i = 0; i<tabList.size(); i++){
      Tab aTab = (Tab) tabList.get(i);
      ScreenID = aTab.getScreen(mouseX,mouseY);
      if (ScreenID != SCREEN_NULL){
        return aTab;
      }     
    }
    return null;  
  }
  
  void scrollTabs(){
    //println(totalTabOffset);
    if (buttonLeft.getEvent(mouseX, mouseY) == -6){
      if (totalTabOffset + 3 > 0){
        offsetSpeed = 0;
      } else {
        offsetSpeed = 3;
      }
    } else if (buttonRight.getEvent(mouseX, mouseY) == -7){
     
      
       if (totalTabOffset - 3 < -maxOffset){
        offsetSpeed = 0;
        //println( totalTabOffset + "  vs " + maxOffset);
      } else {
        offsetSpeed = -3;
      }
      
    } else {
      offsetSpeed = 0;
    }
    if (offsetSpeed != 0){
      for (Tab aTab : tabList){
        aTab.applyOffset(offsetSpeed);
      }
      totalTabOffset += offsetSpeed;
    }
    
  }
  
  int getTabDestination(){  
    int ScreenID;
    for(int i = 0; i<tabList.size(); i++){
      Tab aTab = (Tab) tabList.get(i);
      ScreenID = aTab.getScreen(mouseX,mouseY);
      if (ScreenID != SCREEN_NULL){
        screenNumber = ScreenID;
        //println("ScreenID" + ScreenID);
        return ScreenID;
      }     
    }
    return SCREEN_NULL;  
  }
  
  //creates tabs based on the current screens
  void generateTabs(ArrayList<Screen> screenList){
    if (screenList != null){
      int offset =0;
      for (int i = 0; i < screenList.size(); i++){
        tabList.add(new Tab(80 + (tabWidth+10)* offset, 10, tabWidth, 40, screenList.get(i).getTitle(), color (255), color(255), stdFont, i));
        offset++;
      }
    } else {
      println("Catastrophic Error: No Screen Array Found");
    } 
    
    maxOffset = 80+(tabList.size()-10) * (tabWidth +10);
    //println(maxOffset);
    totalTabOffset = 0;
    for (Tab aTab : tabList){
      aTab.resetOffset();    
    }
  }
  
  // call to reinitialize tabs
  void updateTabs (ArrayList<Screen> screenList){
    
    tabList = new ArrayList<Tab>();
    generateTabs(screenList);
  }
  
  void draw(){
    fill(50);
    rect (0,0, SCREENWIDTH, 60);
    for (Tab aTab : tabList){
     aTab.draw();
    }
    fill(50);
    rect(0,0,70, 60);
    rect(SCREENWIDTH-70,0,70, 60);
    buttonLeft.draw();
    buttonRight.draw();
  }
  
}
