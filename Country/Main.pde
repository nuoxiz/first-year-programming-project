//<<<<<<< .mine
//import java.util.regex.Matcher;
//import java.util.regex.Pattern;
//import java.util.HashMap;
//HashMap<String, ArrayList<AbstractCountry>> dataMap = new HashMap<String, ArrayList<AbstractCountry>>();

//void settings(){
//  size(SCREENWIDTH, SCREENHEIGHT);
//}

//void setup()
//{
//  Table tableData = loadTable("gcat.tsv", "header");
//  dataInitializer(tableData);
//  //printCountries(chinaList);
//  //printCountries(russiaList);
//  background(0);
//  stdFont = loadFont("TimesNewRomanPSMT-15.vlw");
//  textFont(stdFont);
//  textSize(14);
  
//  /*try{
    
//    AbstractCountry china = chinaList.get(0);
//    Class<?> clazz = china.getClass();
//    Field name = clazz.getField("name");
//    Type type = name.getType();
//    println(name);
//    println(type);
//  }
//  catch(NoSuchFieldException ex)
//  {
    
//  }*/
//  tableData = loadTable("gcat.tsv", "header");
  
  
//  // ORDER MATTERS --> this is probably an issue with how label is handled, this needs to change
//  objTotalPerCountry.add(chinaList.size());
//  objTotalPerCountry.add(euList.size());
//  objTotalPerCountry.add(usaList.size());
//  objTotalPerCountry.add(russiaList.size());
//  objTotalPerCountry.add(otherList.size());
//  //objTotalPerCountry.add(earthList.size()); (too big)
  
//  dataMap.put("All", earthList);
//  dataMap.put("China", chinaList);
//  dataMap.put("USA", usaList);
//  dataMap.put("Europe", euList);
//  dataMap.put("Russia", russiaList);
//  dataMap.put("Other", otherList);
  
//  /* label is improperly handled here, need to change this. Best to turn labels into an arraylist of arraylist of labels
//     Reply: An ArrayList<ArrayList<String>> is not flexible. The labels really depends on the users' inputed date
//     so I am intended to have ArrayList<String> for the each type of labels. Everytime the user wants a barchart, 
//     we just override the Strings stored in the corresponding ArrayList, because we only show one barchart
//     at a time. All we need is to change reference of the variable, and the previous label will be collected by Java
//     Garbage Collector.
//   */
//  euByDate = selectDate(euList, initialiseDate("1950 JAN 10"), initialiseDate("2000 JAN 10"), 5, dateLabels);
//  testEUByDate = new BarChart("Number of Space Objects Launched by EU per 5 Year", euByDate, DEFAULT_X, DEFAULT_Y, 70, dateLabels, 5);
//  //println(euByDate.size());
//  //println(dateLabels.size());
  
//  euByMass = selectMass(euList, 0, 2100, 400, massLabels);
//  testEUmass = new BarChart("EU by Mass Bar Chart", euByMass, DEFAULT_X, DEFAULT_Y, 80, massLabels, 1);
//  //println("eu mass" + euByMass.size());
//  //println("eu mass label" + massLabels.size());
  
//  usaPerigee = graphPerigee(usaList);
//  testUSAPerigee = new BarChart("Perigee of US Space Objects", usaPerigee, DEFAULT_X, DEFAULT_Y,75, perigeeLabels, 25);
 
//  usaApogee = graphApogee(usaList);
//  testUSAApogee = new BarChart("Apogee of US Space Objects",usaApogee, DEFAULT_X, DEFAULT_Y,75, apogeeLabels, 25);
 
//  dateLabels = new ArrayList<>();
//  usaByDate = selectDate(usaList, initialiseDate("1950 JAN 10"), initialiseDate("2022 JAN 10"), 5, dateLabels);
//  testEUByDate = new BarChart("Number of Space Objects Launched by EU per 5 Year", euByDate, DEFAULT_X, DEFAULT_Y, 70, dateLabels, 5);
//  testUSAByDate = new BarChart("Number of Space Objects Launched by USA per 5 Year", usaByDate, DEFAULT_X, DEFAULT_Y,70, dateLabels, 10); 
//  testEUDateLine = new LineChart("Launches by EU", euByDate, DEFAULT_X, DEFAULT_Y, 90, dateLabels);
//  testTotalLaunches = new BarChart("Total Launches by Country", objTotalPerCountry, DEFAULT_X, DEFAULT_Y, 70, countryNameList, 100);
//  p = new pieChart("PieChart of Number of Satellites launched per EU, USA, SU, China, and other",300,350,p.PieChart());

//  testEmptyScatter = new ScatterPlot("USA Perigee vs Apogee", usaPerigee, usaApogee, DEFAULT_X, DEFAULT_Y, perigeeLabels, apogeeLabels, 100, 40, "Perigee", "Apogee", 2, 2);
    
//  screenList.add(new Screen(color(50), true, "Home"));
//  screenList.add(new Screen(color(50), false, testTotalLaunches, "Country Launches"));
  
//  currentScreen = screenList.get(0);
  
//  screenList.add(new Screen(color(50), false, testEUmass, "EU Mass"));
//  screenList.add(new Screen(color(50), false, testEUByDate, "EU Launches"));
//  screenList.add(new Screen(color(50), false, testUSAByDate, "USA Launches"));
//  screenList.add(new Screen(color(50), false, testUSAPerigee, "USA Perigee"));
//  screenList.add(new Screen(color(50), false, testUSAApogee, "USA Apogee"));
//  screenList.add(new Screen(color(50), false, p,"PieChart"));
//  screenList.add(new Screen(color(50), false, testEUDateLine, "EU Launches Line"));
  
//  screenList.add(new Screen(color(50), false, testEmptyScatter, "TestScatter"));
  
//  tabNav.generateTabs(screenList);
//  newSearch=new TextWidget(100, 300, 200, 40, "Press here for new search", color(160,160,160), stdFont, 1);
//  screenList.get(0).addWidget(newSearch);
//  s.searchBar();
//  /// UI 
//  controller = new UI(500, 700, 100, 30, new String("Enter Here"), color(255), stdFont, EVENT_TEXT );
//  int initialX = 100;
//  int initialY = 550;
//  int bHeight = 30;
//  int bWidth = 30;
  
//  controller.addCheckBox(controller.new CheckBox(initialX, initialY+20, bHeight, bWidth, "Date", colourWhite, stdFont, EVENT_DATE));
//  initialY += bHeight;
//  controller.addCheckBox(controller.new CheckBox(initialX, initialY+bHeight, bHeight, bWidth, "Mass", colourWhite, stdFont, EVENT_MASS));
//  initialY += bHeight+10;
//  controller.addCheckBox(controller.new CheckBox(initialX, initialY+bHeight, bHeight, bWidth, "Apogee", colourWhite, stdFont, EVENT_APOGEE));
//  initialY += bHeight+10;
//  controller.addCheckBox(controller.new CheckBox(initialX, initialY+bHeight, bHeight, bWidth, "Perigee", colourWhite, stdFont, EVENT_PERIGEE));
//  initialY += bHeight+10;
//  controller.addCheckBox(controller.new CheckBox(initialX, initialY+bHeight, bHeight, bWidth, "Diameter", colourWhite, stdFont, EVENT_DIAMETER));

//  controller.addEnterButton(new Button(615,initialY, 100, 30, "Enter", colourWhite,colourWhite, stdFont, EVENT_ENTER));
//  controller.addClearButton(new Button(725,initialY, 100, 30, "Clear", colourWhite,colourWhite, stdFont, EVENT_CLEAR));
  
//  initialY = 550;
//  controller.addChartSelection(controller.new CheckBox(initialX + 80, initialY+20, bHeight, bWidth, "Bar Chart", colourWhite, stdFont, EVENT_BAR));
//  initialY += bHeight;
//  controller.addChartSelection(controller.new CheckBox(initialX + 80, initialY+bHeight, bHeight, bWidth, "Line Chart", colourWhite, stdFont, EVENT_LINE));
//  controller.addTextDisplay(controller.new TextDisplay(900, 550, 300, 275,
//    guideMessageDate, "", color(50), stdFont, 5));
//}


//void mousePressed(){
  
  
//  if (tabNav.getTabDestination() != SCREEN_NULL){
//    //println("click clack");
//    //println(tabNav.getTabDestination());
//    if (tabNav.getTabDestination() >= 0){
//      Screen aScreen = currentScreen;
//      aScreen.setActive(false);
//      currentScreen = screenList.get(tabNav.getTabDestination());
//      //setTextBoxText(currentScreen, "Text Box", "Text Box"); // passing UI onject instead of currentScreen
//      currentScreen.setActive(true);
//    } else if (tabNav.getTabDestination() == SCREEN_DELETE){
//      //println("delete");
//      Tab aTab = tabNav.getTab();
//      removeScreen(aTab.event);
//    } else {
//      //println("nada");
//    }
//  }
//  if(screenList.get(0).isActive()){
//    event1 = screenList.get(0).getEvent1(mouseX, mouseY);
//    switch(event1){
//      case 1:
//      println("Button 1 was pressed");
//      s.searchBar();
//      event1 =2;
//    }
//  }

//  try
//  {
//    println("event: " + controller.previousBox.event);
//    barClick(currentScreen.Charts, mouseX, mouseY, controller, controller.previousBox.event);
//  }
//  catch(NullPointerException|NoSuchFieldException|IllegalAccessException ex)
//  {
//    println("Null pointer at barClick");
//  }
  
  
//  /// The rest of the code in mousePressed() is written by Nuoxi Zhang on 01/04/2022.
//  textBoxToBeEdited = focusTextWidget(controller.toTextWidget, controller.fromTextWidget,
//  controller.countryTextWidget, controller.intervalTextWidget, mouseX, mouseY);
  
//  clearBoxForTyping(textBoxToBeEdited);
  
//  int event = controller.checkBoxTicked(mouseX, mouseY);
//  int chartEvent = controller.checkChartTicked(mouseX, mouseY);
//  setTextBoxes(controller, event);
//  setGuidingMessage(controller, event);
//  if(controller.enterButton.getEvent(mouseX, mouseY) == EVENT_ENTER)
//  {
//   event = controller.previousBox.event;
//   chartEvent = controller.previousSelection.event;
//   switch(event)
//   {
//     case EVENT_DATE:
//     {
//       try
//       {
//        //println(controller.countryTextWidget.getLabel().trim());
//        eventDate(controller, chartEvent);
//        controller.display.error = "";
//       }catch(InvalidFromInputException | InvalidToInputException | InvalidIntervalInputException | 
//       InvalidInputNullException | InvalidCountryException ex)
//       {
//         controller.display.error = ex.getMessage();
//       }
//       catch(NoSuchFieldException|SecurityException| IllegalArgumentException| IllegalAccessException ex)
//       {
         
//       }
//      break;
//     }
//     case EVENT_MASS:
//     {
//       try
//       {
//         eventMass(controller, chartEvent);
//         controller.display.error = "";
//       }catch(InvalidFromInputException | InvalidToInputException | InvalidIntervalInputException | 
//       InvalidInputNullException | InvalidCountryException ex)
//       {
//         controller.display.error = ex.getMessage();
//       }
//       catch(NoSuchFieldException|SecurityException| IllegalArgumentException| IllegalAccessException ex)
//       {
         
//       }
//       break;
//     }
//     case EVENT_APOGEE:
//     {
//       try{
//         eventApogee(controller, chartEvent);
//         controller.display.error = "";
//       }catch(InvalidFromInputException | InvalidToInputException | InvalidIntervalInputException | 
//       InvalidInputNullException | InvalidCountryException ex)
//       {
//         controller.display.error = ex.getMessage();
//       }
//       catch(NoSuchFieldException|SecurityException| IllegalArgumentException| IllegalAccessException ex)
//       {
         
//       }
//       break;
//     }
//     case EVENT_PERIGEE:
//     {
//       try{
//         eventPerigee(controller, chartEvent);
//         controller.display.error = "";
//       }catch(InvalidFromInputException | InvalidToInputException | InvalidIntervalInputException | 
//       InvalidInputNullException | InvalidCountryException ex)
//       {
//         controller.display.error = ex.getMessage();
//       }
//       catch(NoSuchFieldException|SecurityException| IllegalArgumentException| IllegalAccessException ex)
//       {
         
//       }
//       break;
//     }
//     case EVENT_DIAMETER:
//     {
//       try{
//         eventDiameter(controller, chartEvent);
//         controller.display.error = "";
//       }catch(InvalidFromInputException | InvalidToInputException | InvalidIntervalInputException | 
//       InvalidInputNullException | InvalidCountryException ex)
//       {
//         controller.display.error = ex.getMessage();
//       }
//       catch(NoSuchFieldException|SecurityException| IllegalArgumentException| IllegalAccessException ex)
//       {
         
//       }
//       break;
//     }
//   }
//  }
//  if(controller.clearButton.getEvent(mouseX, mouseY) == EVENT_CLEAR)
//  {
//    event = controller.previousBox.event;
//    setTextBoxes(controller, event);
//    controller.display.error = "";
//  }
  
  
//  mouseHold = true;
//}

//void mouseDragged() {
// if(textScroll >=-200){
//  textScroll += mouseY - pmouseY;
 
//}
//}
//void mouseReleased(){
//  mouseHold = false;
//}

//void keyPressed()
//{
//  if(textBoxToBeEdited != null)
//  {
//    textBoxToBeEdited.append(key);
//  }
//  if (screenList.get(0).isActive()){
//       info.SearchBarChar(key);
   
//  }
//  if(key == ENTER)
//  {
//    try{
//      println(textBoxToBeEdited.getLabel());
//    }catch(NullPointerException ex)
//    {
//    }
//  }
//   //screenList.get(0).Charts.get(0).draw(key);
  
  
//}

//void draw()
//{
   
//   for (Screen screen : screenList){
//     if (screen.isActive()){
//       screen.draw();
//     }
//   }
// if(!screenList.get(0).isActive()){
//    controller.draw(); 
//   }
//  if (mouseHold == true) tabNav.scrollTabs();

//  tabNav.draw();
//  if (screenList.get(0).isActive()){
//    info.display();
//   screenList.get(0).drawWigdet(newSearch);
//  }
//  info.draw();
//}
//||||||| .r69
//import java.util.regex.Matcher;
//import java.util.regex.Pattern;
//import java.util.HashMap;
//HashMap<String, ArrayList<AbstractCountry>> dataMap = new HashMap<String, ArrayList<AbstractCountry>>();

//void settings(){
//  size(SCREENWIDTH, SCREENHEIGHT);
//}

//void setup()
//{
//  Table tableData = loadTable("gcat.tsv", "header");
//  dataInitializer(tableData);
//  //printCountries(chinaList);
//  //printCountries(russiaList);
//  background(0);
//  stdFont = loadFont("TimesNewRomanPSMT-15.vlw");
//  textFont(stdFont);
//  textSize(14);
  
//  /*try{
    
//    AbstractCountry china = chinaList.get(0);
//    Class<?> clazz = china.getClass();
//    Field name = clazz.getField("name");
//    Type type = name.getType();
//    println(name);
//    println(type);
//  }
//  catch(NoSuchFieldException ex)
//  {
    
//  }*/
//  tableData = loadTable("gcat.tsv", "header");
  
  
//  // ORDER MATTERS --> this is probably an issue with how label is handled, this needs to change
//  objTotalPerCountry.add(chinaList.size());
//  objTotalPerCountry.add(euList.size());
//  objTotalPerCountry.add(usaList.size());
//  objTotalPerCountry.add(russiaList.size());
//  objTotalPerCountry.add(otherList.size());
//  //objTotalPerCountry.add(earthList.size()); (too big)
  
//  dataMap.put("All", earthList);
//  dataMap.put("China", chinaList);
//  dataMap.put("USA", usaList);
//  dataMap.put("Europe", euList);
//  dataMap.put("Russia", russiaList);
//  dataMap.put("Other", otherList);
  
//  /* label is improperly handled here, need to change this. Best to turn labels into an arraylist of arraylist of labels
//     Reply: An ArrayList<ArrayList<String>> is not flexible. The labels really depends on the users' inputed date
//     so I am intended to have ArrayList<String> for the each type of labels. Everytime the user wants a barchart, 
//     we just override the Strings stored in the corresponding ArrayList, because we only show one barchart
//     at a time. All we need is to change reference of the variable, and the previous label will be collected by Java
//     Garbage Collector.
//   */
//  euByDate = selectDate(euList, initialiseDate("1950 JAN 10"), initialiseDate("2000 JAN 10"), 5, dateLabels);
//  testEUByDate = new BarChart("Number of Space Objects Launched by EU per 5 Year", euByDate, DEFAULT_X, DEFAULT_Y, 70, dateLabels, 5);
//  //println(euByDate.size());
//  //println(dateLabels.size());
  
//  euByMass = selectMass(euList, 0, 2100, 400, massLabels);
//  testEUmass = new BarChart("EU by Mass Bar Chart", euByMass, DEFAULT_X, DEFAULT_Y, 80, massLabels, 1);
//  //println("eu mass" + euByMass.size());
//  //println("eu mass label" + massLabels.size());
  
//  usaPerigee = graphPerigee(usaList);
//  testUSAPerigee = new BarChart("Perigee of US Space Objects", usaPerigee, DEFAULT_X, DEFAULT_Y,75, perigeeLabels, 25);
 
//  usaApogee = graphApogee(usaList);
//  testUSAApogee = new BarChart("Apogee of US Space Objects",usaApogee, DEFAULT_X, DEFAULT_Y,75, apogeeLabels, 25);
 
//  dateLabels = new ArrayList<>();
//  usaByDate = selectDate(usaList, initialiseDate("1950 JAN 10"), initialiseDate("2022 JAN 10"), 5, dateLabels);
//  testEUByDate = new BarChart("Number of Space Objects Launched by EU per 5 Year", euByDate, DEFAULT_X, DEFAULT_Y, 70, dateLabels, 5);
//  testUSAByDate = new BarChart("Number of Space Objects Launched by USA per 5 Year", usaByDate, DEFAULT_X, DEFAULT_Y,70, dateLabels, 10); 
//  testEUDateLine = new LineChart("Launches by EU", euByDate, DEFAULT_X, DEFAULT_Y, 90, dateLabels);
//  testTotalLaunches = new BarChart("Total Launches by Country", objTotalPerCountry, DEFAULT_X, DEFAULT_Y, 70, countryNameList, 100);
//  p = new pieChart("PieChart of Number of Satellites launched per EU, USA, SU, China, and other",300,350,p.PieChart());

//  testEmptyScatter = new ScatterPlot("USA Perigee vs Apogee", usaPerigee, usaApogee, DEFAULT_X, DEFAULT_Y, perigeeLabels, apogeeLabels, 100, 40, "Perigee", "Apogee", 2, 2);
    
//  screenList.add(new Screen(color(50), true, "Home"));
//  screenList.add(new Screen(color(50), false, testTotalLaunches, "Country Launches"));
  
//  currentScreen = screenList.get(0);
  
//  screenList.add(new Screen(color(50), false, testEUmass, "EU Mass"));
//  screenList.add(new Screen(color(50), false, testEUByDate, "EU Launches"));
//  screenList.add(new Screen(color(50), false, testUSAByDate, "USA Launches"));
//  screenList.add(new Screen(color(50), false, testUSAPerigee, "USA Perigee"));
//  screenList.add(new Screen(color(50), false, testUSAApogee, "USA Apogee"));
//  screenList.add(new Screen(color(50), false, p,"PieChart"));
//  screenList.add(new Screen(color(50), false, testEUDateLine, "EU Launches Line"));
  
//  screenList.add(new Screen(color(50), false, testEmptyScatter, "TestScatter"));
  
//  tabNav.generateTabs(screenList);
//  newSearch=new TextWidget(100, 300, 200, 40, "Press here for new search", color(160,160,160), stdFont, 1);
//  screenList.get(0).addWidget(newSearch);
//  s.searchBar();
//  /// UI 
//  controller = new UI(500, 700, 100, 30, new String("Enter Here"), color(255), stdFont, EVENT_TEXT );
//  int initialX = 100;
//  int initialY = 550;
//  int bHeight = 30;
//  int bWidth = 30;
  
//  controller.addCheckBox(controller.new CheckBox(initialX, initialY+20, bHeight, bWidth, "Date", colourWhite, stdFont, EVENT_DATE));
//  initialY += bHeight;
//  controller.addCheckBox(controller.new CheckBox(initialX, initialY+bHeight, bHeight, bWidth, "Mass", colourWhite, stdFont, EVENT_MASS));
//  initialY += bHeight+10;
//  controller.addCheckBox(controller.new CheckBox(initialX, initialY+bHeight, bHeight, bWidth, "Apogee", colourWhite, stdFont, EVENT_APOGEE));
//  initialY += bHeight+10;
//  controller.addCheckBox(controller.new CheckBox(initialX, initialY+bHeight, bHeight, bWidth, "Perigee", colourWhite, stdFont, EVENT_PERIGEE));
//  initialY += bHeight+10;
//  controller.addCheckBox(controller.new CheckBox(initialX, initialY+bHeight, bHeight, bWidth, "Diameter", colourWhite, stdFont, EVENT_DIAMETER));

//  controller.addEnterButton(new Button(615,initialY, 100, 30, "Enter", colourWhite,colourWhite, stdFont, EVENT_ENTER));
//  controller.addClearButton(new Button(725,initialY, 100, 30, "Clear", colourWhite,colourWhite, stdFont, EVENT_CLEAR));
  
//  initialY = 550;
//  controller.addChartSelection(controller.new CheckBox(initialX + 80, initialY+20, bHeight, bWidth, "Bar Chart", colourWhite, stdFont, EVENT_BAR));
//  initialY += bHeight;
//  controller.addChartSelection(controller.new CheckBox(initialX + 80, initialY+bHeight, bHeight, bWidth, "Line Chart", colourWhite, stdFont, EVENT_LINE));
//  controller.addTextDisplay(controller.new TextDisplay(900, 550, 300, 275,
//    guideMessageDate, "", color(50), stdFont, 5));
//}


//void mousePressed(){
  
  
//  if (tabNav.getTabDestination() != SCREEN_NULL){
//    //println("click clack");
//    //println(tabNav.getTabDestination());
//    if (tabNav.getTabDestination() >= 0){
//      Screen aScreen = currentScreen;
//      aScreen.setActive(false);
//      currentScreen = screenList.get(tabNav.getTabDestination());
//      //setTextBoxText(currentScreen, "Text Box", "Text Box"); // passing UI onject instead of currentScreen
//      currentScreen.setActive(true);
//    } else if (tabNav.getTabDestination() == SCREEN_DELETE){
//      //println("delete");
//      Tab aTab = tabNav.getTab();
//      removeScreen(aTab.event);
//    } else {
//      //println("nada");
//    }
//  }
//  if(screenList.get(0).isActive()){
//    event1 = screenList.get(0).getEvent1(mouseX, mouseY);
//    switch(event1){
//      case 1:
//      println("Button 1 was pressed");
//      s.searchBar();
//      event1 =2;
//    }
//  }
  
//  /// The rest of the code in mousePressed() is written by Nuoxi Zhang on 01/04/2022.
//  textBoxToBeEdited = focusTextWidget(controller.toTextWidget, controller.fromTextWidget,
//  controller.countryTextWidget, controller.intervalTextWidget, mouseX, mouseY);
  
//  clearBoxForTyping(textBoxToBeEdited);
  
//  int event = controller.checkBoxTicked(mouseX, mouseY);
//  int chartEvent = controller.checkChartTicked(mouseX, mouseY);
//  setTextBoxes(controller, event);
//  setGuidingMessage(controller, event);
//  if(controller.enterButton.getEvent(mouseX, mouseY) == EVENT_ENTER)
//  {
//   event = controller.previousBox.event;
//   chartEvent = controller.previousSelection.event;
//   switch(event)
//   {
//     case EVENT_DATE:
//     {
//       try
//       {
//        //println(controller.countryTextWidget.getLabel().trim());
//        eventDate(controller, chartEvent);
//        controller.display.error = "";
//       }catch(InvalidFromInputException | InvalidToInputException | InvalidIntervalInputException | 
//       InvalidInputNullException | InvalidCountryException ex)
//       {
//         controller.display.error = ex.getMessage();
//       }
//       catch(NoSuchFieldException|SecurityException| IllegalArgumentException| IllegalAccessException ex)
//       {
         
//       }
//      break;
//     }
//     case EVENT_MASS:
//     {
//       try
//       {
//         eventMass(controller, chartEvent);
//         controller.display.error = "";
//       }catch(InvalidFromInputException | InvalidToInputException | InvalidIntervalInputException | 
//       InvalidInputNullException | InvalidCountryException ex)
//       {
//         controller.display.error = ex.getMessage();
//       }
//       catch(NoSuchFieldException|SecurityException| IllegalArgumentException| IllegalAccessException ex)
//       {
         
//       }
//       break;
//     }
//     case EVENT_APOGEE:
//     {
//       try{
//         eventApogee(controller, chartEvent);
//         controller.display.error = "";
//       }catch(InvalidFromInputException | InvalidToInputException | InvalidIntervalInputException | 
//       InvalidInputNullException | InvalidCountryException ex)
//       {
//         controller.display.error = ex.getMessage();
//       }
//       catch(NoSuchFieldException|SecurityException| IllegalArgumentException| IllegalAccessException ex)
//       {
         
//       }
//       break;
//     }
//     case EVENT_PERIGEE:
//     {
//       try{
//         eventPerigee(controller, chartEvent);
//         controller.display.error = "";
//       }catch(InvalidFromInputException | InvalidToInputException | InvalidIntervalInputException | 
//       InvalidInputNullException | InvalidCountryException ex)
//       {
//         controller.display.error = ex.getMessage();
//       }
//       catch(NoSuchFieldException|SecurityException| IllegalArgumentException| IllegalAccessException ex)
//       {
         
//       }
//       break;
//     }
//     case EVENT_DIAMETER:
//     {
//       try{
//         eventDiameter(controller, chartEvent);
//         controller.display.error = "";
//       }catch(InvalidFromInputException | InvalidToInputException | InvalidIntervalInputException | 
//       InvalidInputNullException | InvalidCountryException ex)
//       {
//         controller.display.error = ex.getMessage();
//       }
//       catch(NoSuchFieldException|SecurityException| IllegalArgumentException| IllegalAccessException ex)
//       {
         
//       }
//       break;
//     }
//   }
//  }
//  if(controller.clearButton.getEvent(mouseX, mouseY) == EVENT_CLEAR)
//  {
//    event = controller.previousBox.event;
//    setTextBoxes(controller, event);
//    controller.display.error = "";
//  }
  
  
//  mouseHold = true;
//}

//void mouseDragged() {
// if(textScroll >=-200){
//  textScroll += mouseY - pmouseY;
 
//}
//}
//void mouseReleased(){
//  mouseHold = false;
//}

//void keyPressed()
//{
//  if(textBoxToBeEdited != null)
//  {
//    textBoxToBeEdited.append(key);
//  }
//  if (screenList.get(0).isActive()){
//       info.SearchBarChar(key);
   
//  }
//  if(key == ENTER)
//  {
//    try{
//      println(textBoxToBeEdited.getLabel());
//    }catch(NullPointerException ex)
//    {
//    }
//  }
//   //screenList.get(0).Charts.get(0).draw(key);
  
  
//}

//void draw()
//{
   
//   for (Screen screen : screenList){
//     if (screen.isActive()){
//       screen.draw();
//     }
//   }
// if(!screenList.get(0).isActive()){
//    controller.draw(); 
//   }
//  if (mouseHold == true) tabNav.scrollTabs();

//  tabNav.draw();
//  if (screenList.get(0).isActive()){
//    info.display();
//   screenList.get(0).drawWigdet(newSearch);
//  }
//  info.draw();
//}
//=======
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.HashMap;
HashMap<String, ArrayList<AbstractCountry>> dataMap = new HashMap<String, ArrayList<AbstractCountry>>();

void settings(){
  size(SCREENWIDTH, SCREENHEIGHT);
}

void setup()
{
  Table tableData = loadTable("gcat.tsv", "header");
  dataInitializer(tableData);
  //printCountries(chinaList);
  //printCountries(russiaList);
  background(0);
  stdFont = loadFont("TimesNewRomanPSMT-15.vlw");
  textFont(stdFont);
  textSize(14);
  
  /*try{
    
    AbstractCountry china = chinaList.get(0);
    Class<?> clazz = china.getClass();
    Field name = clazz.getField("name");
    Type type = name.getType();
    println(name);
    println(type);
  }
  catch(NoSuchFieldException ex)
  {
    
  }*/
  tableData = loadTable("gcat.tsv", "header");
  
  
  // ORDER MATTERS --> this is probably an issue with how label is handled, this needs to change
  objTotalPerCountry.add(chinaList.size());
  objTotalPerCountry.add(euList.size());
  objTotalPerCountry.add(usaList.size());
  objTotalPerCountry.add(russiaList.size());
  objTotalPerCountry.add(otherList.size());
  //objTotalPerCountry.add(earthList.size()); (too big)
  
  dataMap.put("All", earthList);
  dataMap.put("China", chinaList);
  dataMap.put("USA", usaList);
  dataMap.put("Europe", euList);
  dataMap.put("Russia", russiaList);
  dataMap.put("Other", otherList);
  
  /* label is improperly handled here, need to change this. Best to turn labels into an arraylist of arraylist of labels
     Reply: An ArrayList<ArrayList<String>> is not flexible. The labels really depends on the users' inputed date
     so I am intended to have ArrayList<String> for the each type of labels. Everytime the user wants a barchart, 
     we just override the Strings stored in the corresponding ArrayList, because we only show one barchart
     at a time. All we need is to change reference of the variable, and the previous label will be collected by Java
     Garbage Collector.
   */
  euByDate = selectDate(euList, initialiseDate("1950 JAN 10"), initialiseDate("2000 JAN 10"), 5, dateLabels);
  testEUByDate = new BarChart("Number of Space Objects Launched by EU per 5 Year", euByDate, DEFAULT_X, DEFAULT_Y, 70, dateLabels, 5);
  //println(euByDate.size());
  //println(dateLabels.size());
  
  euByMass = selectMass(euList, 0, 2100, 400, massLabels);
  testEUmass = new BarChart("EU by Mass Bar Chart", euByMass, DEFAULT_X, DEFAULT_Y, 80, massLabels, 1);
  testEUmass.currentEvent = "mass";
  //println("eu mass" + euByMass.size());
  //println("eu mass label" + massLabels.size());
  
  usaPerigee = graphPerigee(usaList);
  testUSAPerigee = new BarChart("Perigee of US Space Objects", usaPerigee, DEFAULT_X, DEFAULT_Y,75, perigeeLabels, 25);
  testUSAPerigee.currentEvent = "perigee";
  usaApogee = graphApogee(usaList);
  testUSAApogee = new BarChart("Apogee of US Space Objects",usaApogee, DEFAULT_X, DEFAULT_Y,75, apogeeLabels, 25);
  testUSAApogee.currentEvent = "apogee";
  dateLabels = new ArrayList<>();
  usaByDate = selectDate(usaList, initialiseDate("1950 JAN 10"), initialiseDate("2022 JAN 10"), 5, dateLabels);
  testEUByDate = new BarChart("Number of Space Objects Launched by EU per 5 Year", euByDate, DEFAULT_X, DEFAULT_Y, 70, dateLabels, 5);
  testEUByDate.currentEvent = "date";
  testUSAByDate = new BarChart("Number of Space Objects Launched by USA per 5 Year", usaByDate, DEFAULT_X, DEFAULT_Y,70, dateLabels, 10); 
  testUSAByDate.currentEvent = "date";
  testEUDateLine = new LineChart("Launches by EU", euByDate, DEFAULT_X, DEFAULT_Y, 90, dateLabels);
  testEUDateLine.currentEvent = "date";
  testTotalLaunches = new BarChart("Total Launches by Country", objTotalPerCountry, DEFAULT_X, DEFAULT_Y, 70, countryNameList, 100);
  
  p = new pieChart("PieChart of Number of Satellites launched per EU, USA, SU, China, and other",300,350,p.PieChart());

  testEmptyScatter = new ScatterPlot("USA Perigee vs Apogee", usaPerigee, usaApogee, DEFAULT_X, DEFAULT_Y, perigeeLabels, apogeeLabels, 100, 40, "Perigee", "Apogee", 2, 2);
    
  screenList.add(new Screen(color(50), true, "Home"));
  screenList.add(new Screen(color(50), false, testTotalLaunches, "Country Launches"));
  currentScreen = screenList.get(0);
  screenList.add(new Screen(color(50), false, testEUmass, "EU Mass"));
  screenList.add(new Screen(color(50), false, testEUByDate, "EU Launches"));
  screenList.add(new Screen(color(50), false, testUSAByDate, "USA Launches"));
  screenList.add(new Screen(color(50), false, testUSAPerigee, "USA Perigee"));
  screenList.add(new Screen(color(50), false, testUSAApogee, "USA Apogee"));
  screenList.add(new Screen(color(50), false, p,"PieChart"));
  screenList.add(new Screen(color(50), false, testEUDateLine, "EU Launches Line"));
  
  //screenList.add(new Screen(color(50), false, testEmptyScatter, "TestScatter"));
  
  tabNav.generateTabs(screenList);
  
  newSearch=new TextWidget(100, 300, 200, 40, "Press here for new search", color(255), stdFont, 1);
  
  screenList.get(0).addWidget(newSearch);
  s.searchBar();
  /// UI 
  controller = new UI(500, 700, 100, 30, new String("Enter Here"), color(255), stdFont, EVENT_TEXT );
  
  int initialX = 100;
  int initialY = 550;
  int bHeight = 30;
  int bWidth = 30;
  
  controller.addCheckBox(controller.new CheckBox(initialX, initialY+20, bHeight, bWidth, "Date", colourWhite, stdFont, EVENT_DATE));
  initialY += bHeight;
  controller.addCheckBox(controller.new CheckBox(initialX, initialY+bHeight, bHeight, bWidth, "Mass", colourWhite, stdFont, EVENT_MASS));
  initialY += bHeight+10;
  controller.addCheckBox(controller.new CheckBox(initialX, initialY+bHeight, bHeight, bWidth, "Apogee", colourWhite, stdFont, EVENT_APOGEE));
  initialY += bHeight+10;
  controller.addCheckBox(controller.new CheckBox(initialX, initialY+bHeight, bHeight, bWidth, "Perigee", colourWhite, stdFont, EVENT_PERIGEE));
  initialY += bHeight+10;
  controller.addCheckBox(controller.new CheckBox(initialX, initialY+bHeight, bHeight, bWidth, "Diameter", colourWhite, stdFont, EVENT_DIAMETER));

  controller.addEnterButton(new Button(615,initialY, 100, 30, "Enter", colourWhite,colourWhite, stdFont, EVENT_ENTER));
  controller.addClearButton(new Button(725,initialY, 100, 30, "Clear", colourWhite,colourWhite, stdFont, EVENT_CLEAR));
  
  initialY = 550;
  controller.addChartSelection(controller.new CheckBox(initialX + 80, initialY+20, bHeight, bWidth, "Bar Chart", colourWhite, stdFont, EVENT_BAR));
  initialY += bHeight;
  controller.addChartSelection(controller.new CheckBox(initialX + 80, initialY+bHeight, bHeight, bWidth, "Line Chart", colourWhite, stdFont, EVENT_LINE));
  controller.addTextDisplay(controller.new TextDisplay(900, 550, 300, 275,
    guideMessageDate, "", color(50), stdFont, 5));
}


void mousePressed(){
  mousePressX = mouseX;
  mousePressY = mouseY;
  
  if (tabNav.getTabDestination() != SCREEN_NULL){
    //println("click clack");
    //println(tabNav.getTabDestination());
    if (tabNav.getTabDestination() >= 0){
      Screen aScreen = currentScreen;
      aScreen.setActive(false);
      currentScreen = screenList.get(tabNav.getTabDestination());
      //setTextBoxText(currentScreen, "Text Box", "Text Box"); // passing UI onject instead of currentScreen
      currentScreen.setActive(true);
    } else if (tabNav.getTabDestination() == SCREEN_DELETE){
      //println("delete");
      Tab aTab = tabNav.getTab();
      removeScreen(aTab.event);
    } else {
      //println("nada");
    }
  }
  if(screenList.get(0).isActive()){
    event1 = screenList.get(0).getEvent1(mouseX, mouseY);
    switch(event1){
      case 1:
      //println("Button 1 was pressed");
      s.searchBar();
      event1 =2;
    }
  }
  ///////////// bar zoom ////////////
  /// The logic for zooming the bar was implemented by Nuoxi Zhang
  try
  {
    println("event: " + controller.previousBox.event);
    barClick(currentScreen.Charts, mouseX, mouseY, controller, controller.previousBox.event);
  }
  catch(NullPointerException|NoSuchFieldException|IllegalAccessException ex)
  {
    println("Null pointer at barClick");
  }
  ///////////// bar zoom //////////
  
  /// The rest of the code in mousePressed() is written by Nuoxi Zhang on 01/04/2022.
  textBoxToBeEdited = focusTextWidget(controller.toTextWidget, controller.fromTextWidget,
  controller.countryTextWidget, controller.intervalTextWidget, mouseX, mouseY);
  
  clearBoxForTyping(textBoxToBeEdited);
  
  int event = controller.checkBoxTicked(mouseX, mouseY);
  int chartEvent = controller.checkChartTicked(mouseX, mouseY);
  setTextBoxes(controller, event);
  setGuidingMessage(controller, event);
  if(controller.enterButton.getEvent(mouseX, mouseY) == EVENT_ENTER)
  {
   event = controller.previousBox.event;
   chartEvent = controller.previousSelection.event;
   switch(event)
   {
     case EVENT_DATE:
     {
       try
       {
        //println(controller.countryTextWidget.getLabel().trim());
        eventDate(controller, chartEvent);
        controller.display.error = "";
       }catch(InvalidFromInputException | InvalidToInputException | InvalidIntervalInputException | 
       InvalidInputNullException | InvalidCountryException ex)
       {
         controller.display.error = ex.getMessage();
       }
       catch(NoSuchFieldException|SecurityException| IllegalArgumentException| IllegalAccessException ex)
       {
         
       }
      break;
     }
     case EVENT_MASS:
     {
       try
       {
         eventMass(controller, chartEvent);
         controller.display.error = "";
       }catch(InvalidFromInputException | InvalidToInputException | InvalidIntervalInputException | 
       InvalidInputNullException | InvalidCountryException ex)
       {
         controller.display.error = ex.getMessage();
       }
       catch(NoSuchFieldException|SecurityException| IllegalArgumentException| IllegalAccessException ex)
       {
         
       }
       break;
     }
     case EVENT_APOGEE:
     {
       try{
         eventApogee(controller, chartEvent);
         controller.display.error = "";
       }catch(InvalidFromInputException | InvalidToInputException | InvalidIntervalInputException | 
       InvalidInputNullException | InvalidCountryException ex)
       {
         controller.display.error = ex.getMessage();
       }
       catch(NoSuchFieldException|SecurityException| IllegalArgumentException| IllegalAccessException ex)
       {
         
       }
       break;
     }
     case EVENT_PERIGEE:
     {
       try{
         eventPerigee(controller, chartEvent);
         controller.display.error = "";
       }catch(InvalidFromInputException | InvalidToInputException | InvalidIntervalInputException | 
       InvalidInputNullException | InvalidCountryException ex)
       {
         controller.display.error = ex.getMessage();
       }
       catch(NoSuchFieldException|SecurityException| IllegalArgumentException| IllegalAccessException ex)
       {
         
       }
       break;
     }
     case EVENT_DIAMETER:
     {
       try{
         eventDiameter(controller, chartEvent);
         controller.display.error = "";
       }catch(InvalidFromInputException | InvalidToInputException | InvalidIntervalInputException | 
       InvalidInputNullException | InvalidCountryException ex)
       {
         controller.display.error = ex.getMessage();
       }
       catch(NoSuchFieldException|SecurityException| IllegalArgumentException| IllegalAccessException ex)
       {
         
       }
       break;
     }
   }
  }
  if(controller.clearButton.getEvent(mouseX, mouseY) == EVENT_CLEAR)
  {
    event = controller.previousBox.event;
    setTextBoxes(controller, event);
    controller.display.error = "";
  }
  
  
  mouseHold = true;
}

void mouseDragged() {
  //println(info.details.size() + " " + info.displayedValues);
  if (info.displayedValues >=19){
    //println("inside");
   if (mousePressX >= info.x-10 && mousePressX <= SCREENWIDTH-10 && mousePressY >= info.y-10  && mousePressY <=DEFAULT_Y){
      //println("inside2");
      if(textScroll - (mouseY - pmouseY) >= 0){
        //println("insid677e");   
        textScroll -= mouseY - pmouseY;
      } else if (textScroll - (mouseY - pmouseY) < 0) {
        textScroll = 0;
         //println("Error1");
      } else {
       // println("Error2");
      }
      
    } else {
     //DEBUG HITBOXING
      
      //println(info.x + "  " + info.y);
      //fill (255, 0 , 0);
      //rect (info.x-10, info.y, SCREENWIDTH - info.x, DEFAULT_Y+10 - info.y);
      //fill (0, 255 , 0);
     // ellipse(mousePressX, mousePressY, 10.0, 10.0);
     
    }
  } else if (info.details.size() > 10) {
    textScroll -= 20;
     //println("Error3");
  }
  
  mousePre2X = pmouseX;
  mousePre2Y = pmouseY;
}
void mouseReleased(){
  mouseHold = false;
}

void keyPressed()
{
  if(textBoxToBeEdited != null)
  {
    textBoxToBeEdited.append(key);
  }
  if (screenList.get(0).isActive()){
       info.SearchBarChar(key);
   
  }
  if(key == ENTER)
  {
    try{
       //println(textBoxToBeEdited.getLabel());
    }catch(NullPointerException ex)
    {
    }
  }
   //screenList.get(0).Charts.get(0).draw(key);
  
  
}

void draw()
{
   
   for (Screen screen : screenList){
     if (screen.isActive()){
       screen.draw();
     }
   }
  
   controller.draw(); 
   if (mouseHold == true) tabNav.scrollTabs();
     tabNav.draw();
   if (screenList.get(0).isActive()){
     info.display();
     screenList.get(0).drawWigdet(newSearch);
     info.draw();  
 }
   
}
//>>>>>>> .r70
