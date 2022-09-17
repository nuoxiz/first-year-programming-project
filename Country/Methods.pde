 //<>//
/* //<>// //<>// //<>// //<>// //<>// //<>//
  This method take a String lDate and return an Date object.
  This method is implemented by Nuoxi Zhang on 2022/03/17.
*/
public Calendar initialiseDate(String lDate)
{
   /*
     ModifyDate is a method local inner class. It is implmented to help code mangement.
     This inner class is implemented by Nuoxi Zhang on 2022/03/17.
   */
   class ModifyDate
   {
    /* 
    This method takes the String launch date of the format like "2006 SEP 16" and return in a format like:
    "2006 09 16" so that launch date can be parsed to Date object. This function is needed because formatter.parse(lDate)
    in the method initialiseDate() have trouble parsing some date in the format of "2000 SEP 14".
    This method is implemented by Nuoxi Zhang on 2022/03/17
    */
      public String modifyDateString(String lDate)
      {
          try
          {
            String month =  lDate.substring(5, 8);
            if(month.equalsIgnoreCase("JAN"))
              return lDate.substring(0,4) + " 01 " + lDate.substring(9,11);
            else if(month.equalsIgnoreCase("FEB"))
              return lDate.substring(0,4) + " 02 " + lDate.substring(9,11);
            else if(month.equalsIgnoreCase("MAR"))
              return lDate.substring(0,4) + " 03 " + lDate.substring(9,11);
            else if(month.equalsIgnoreCase("APR"))
              return lDate.substring(0,4) + " 04 " + lDate.substring(9,11);
            else if(month.equalsIgnoreCase("MAY"))
              return lDate.substring(0,4) + " 05 " + lDate.substring(9,11);
            else if(month.equalsIgnoreCase("JUN"))
              return lDate.substring(0,4) + " 06 " + lDate.substring(9,11);
            else if(month.equalsIgnoreCase("JUL"))
              return lDate.substring(0,4) + " 07 " + lDate.substring(9,11);
            else if(month.equalsIgnoreCase( "AUG"))
              return lDate.substring(0,4) + " 08 " + lDate.substring(9,11);
            else if(month.equalsIgnoreCase( "SEP"))
              return lDate.substring(0,4) + " 09 " + lDate.substring(9,11);
            else if(month.equalsIgnoreCase( "OCT"))
              return lDate.substring(0,4) + " 10 " + lDate.substring(9,11);
            else if(month.equalsIgnoreCase( "NOV"))
              return lDate.substring(0,4) + " 11 " + lDate.substring(9,11);
            else if(month.equalsIgnoreCase( "DEC"))
              return lDate.substring(0,4) + " 12 " + lDate.substring(9,11);
          }
        catch(StringIndexOutOfBoundsException ex)
        {
          
        }
        return "1900 01 01";
      }
   }
   ModifyDate obj = new ModifyDate();
   lDate = obj.modifyDateString(lDate);
   SimpleDateFormat formatter = new SimpleDateFormat("yyyy MM dd");
   Calendar retValue = null;
   try
   {
      Date date = formatter.parse(lDate);
      Calendar cal = Calendar.getInstance();
      cal.setTime(date);
      retValue = cal;
   }
   catch(ParseException ex)
   {
     ex.printStackTrace();
   }
   return retValue;
}
// end of Calendar // 



/* 
   This method print out all the instances of the country contained in the list.
   This method is implemented by Nuoxi Zhang on 2022/03/17
*/
void printCountries(ArrayList<AbstractCountry> list)
{
  for(AbstractCountry c : list)
    println(c.toString());
}

/*
the dataInitializer method loads the data from the table according the the columns 
we were told to focus on
- isioma anonyai
*/
// This class is implemented by Isioma Anonyai on 18/03/2022

public void dataInitializer(Table table)
{
  table = loadTable("gcat.tsv" , "header"); //loads in the data from the table
  for(TableRow row : table.rows())
  {
    String country = row.getString("State");
    String status = row.getString("Status");
    String name = row.getString("Name");
    Calendar lDate = initialiseDate(row.getString("LDate"));
   int apogee = 0;
    //this iterates over the specificed columns through rows
    try
    {
      apogee = Integer.parseInt(row.getString("Apogee"));
    }
    catch(NumberFormatException ex)
    {
      apogee = Integer.MAX_VALUE; //incase of an error where we are not able to get the double table
    }
    int perigee = 0;
    try
    {
      perigee = Integer.parseInt(row.getString("Perigee"));
    } 
    catch(NumberFormatException ex)
    {
      perigee = Integer.MAX_VALUE; //incase of an error where we are not able to get the double from the table
    }
    double diameter = 0;
    try
    {
      diameter = Double.parseDouble(row.getString("Diameter"));
      
    }
    catch(NumberFormatException ex)
    {
      
    }
    double mass = 0;
    try
    {
      mass = Double.parseDouble(row.getString("Mass"));
      
    }catch(NumberFormatException ex)
    {
    }
    List.add(new OtherName(name, status, apogee, perigee, diameter, mass, lDate));
    //The code for initializing the countries: CN and SU was implemented by Nuoxi Zhang on 2022/03/18
    earthList.add(new Earth(name, status, apogee, perigee, diameter, mass, lDate));
    if(country.equals("CN"))
    {
      chinaList.add(new China(name, status, apogee, perigee, diameter, mass, lDate)); 
    }
    else if(country.equals("SU") ||country.equals("RU") )
    {
      russiaList.add(new Russia(name, status, apogee, perigee, diameter, mass, lDate));
    }
    
    //The code for initializing the countries: EU was implemeted by Mykhailo Bitiutskyy on 21/03/2022
    else if(country.equals("EU") || country.equals("UK") || country.equals("I") || country.equals("F") || country.equals("I-ESRO") ||
    country.equals("D") || country.equals("I-NATO") || country.equals("NL") || country.equals("E") || country.equals("I-ESA") ||
    country.equals("I-EUT") || country.equals("S") || country.equals("I-EUM") || country.equals("I-INM") || country.equals("CZ") ||
    country.equals("UA") || country.equals("TR") || country.equals("DK") || country.equals("GR") || country.equals("HU") || 
    country.equals("PL") || country.equals("RO") || country.equals("BY") || country.equals("AT") || country.equals("EE") ||
    country.equals("I-EU") || country.equals("MC") || country.equals("IE") || country.equals("LT") || country.equals("LV") ||
    country.equals("BG") || country.equals("SK") || country.equals("SI"))
    {
      euList.add(new EU(name, status, apogee, perigee, diameter, mass, lDate));
    }
    else if(country.equals("US"))
    {
      usaList.add(new USA(name, status, apogee, perigee, diameter, mass, lDate));
    }
    else 
    {
      otherList.add(new Other(name, status, apogee, perigee, diameter, mass, lDate));
    }
  }
  
  
  
}

/*
  The following method print instances of AbstractCountry contained in list upto the index defined in variable "size".
  This method is implemented by Nuoxi Zhang on 2022/03/18.
*/
void printInstanceOnScreen(ArrayList<AbstractCountry> list, String country)
{
  int size = 20;
  float y = 30;
  text("Below is a preview of the Space objects from " + country + ":", 0, 10);
  for(int i = 0; i < size; i++)
  { 
    text(list.get(i).toString(), 0, y);
    y += 20;
  }   
}
/*
  This method is implemented by Nuoxi Zhang on 2022/03/18
  This method return an ArrayList of type Bar.
  The most important parameters are data and labels. data contains the counter of space objects associated with the
  query and labels contains the String label that goes under each corresponding bar.
*/
ArrayList<Bar> generateBars(ArrayList<Integer> data, float xpos, float ypos, float barWidth, ArrayList<String> labels)
{
  if (data != null){
  
    ArrayList<Bar> retList = new ArrayList<Bar>();
    for(int i = 0; i < data.size(); i++)
    {
      Bar bar = new Bar(xpos, ypos, data.get(i), barWidth, labels.get(i));
      xpos+=barWidth;
      retList.add(bar);
    }
    //totalWidthOfBars = xpos;
    return retList;
    
  } else {
    println("Error: NullPointerException in generateBars");
  }
  return null;
}
/*
  This overloaded method is implemented by Nuoxi Zhang on 2022/03/22
  It provide the user an option to input the scale factor. By default scale factor is set to 100 in Bar class.
*/
ArrayList<Bar> generateBars(ArrayList<Integer> data, float xpos, float ypos, float barWidth, ArrayList<String> labels, int scaleFactor)
{
  if (data != null){
    ArrayList<Bar> retList = new ArrayList<Bar>();
    for(int i = 0; i < data.size(); i++)
    {
      Bar bar = new Bar(xpos, ypos, data.get(i), barWidth, labels.get(i), scaleFactor);
      //println(labels.get(i));
      xpos += barWidth + DISTANCE_BETWEEN_BARS; // modified by Nuoxi Zhang on 01/04/2022
      retList.add(bar);
    }
    //totalWidthOfBars = xpos;
    return retList;
    
  } else {
    println("Error: NullPointerException in generateBars");
  }
  return null;
}





/*
  This method is implemented by Nuoxi Zhang on 2022/03/18.
  This method draws the barchart and the margins.
  
  This method name was changed to drawBars (as it only draws the bars and not the whole chart)
*/
void drawBars(ArrayList<Bar> bars)
{
  if (bars != null){ // Null pointer Catch added by Liam Zone March 30th 2022
    short distance = 20; // distance between the bar and the label
    for(Bar bar : bars)
    {
      shape(bar.shape);
      text(bar.label, bar.xpos+5 , bar.ypos + distance);
      // bar.ypos minus abs(bar.value/bar.scaleFactor)- distance because in Processing the index start at top left cornor, 
      // so I have to minus to get the bars upright
      text(bar.value, bar.xpos+5,  bar.ypos - abs(bar.value/bar.scaleFactor)- distance); 
    }
  }
  //Bar.Margin margin = bars.get(0).new Margin(250, totalWidthOfBars);
  //shape(margin.left); shape(margin.bottom);
  
}

/*
  drawMargin() is implemented by Nuoxi Zhang on 29/03/2022.
*/
void drawMargin(float xpos, float ypos, float mHeight, float mWidth)
{
      PShape left = createShape(LINE, xpos-10, ypos+5, xpos-10, ypos+5 + -(mHeight));
      left.setStroke(255);
      PShape bottom = createShape(LINE, xpos - 10, ypos+5, xpos+mWidth, ypos+5);
      bottom.setStroke(255);
      shape(left);
      shape(bottom);
}


/*define perigee and apogee ranges arraylist with the ranges(0-550,550-2500,2500-5000,5000-7500,7500-10000,10000-250000)
create array of size where each index represents a label
iterate through country list and get perigeee and apogee
if statement to see which index of the array we should incement
convert array to arraylist
return arraylist
implemented by Isioma Anonyai
*/ 
ArrayList<Integer> graphPerigee(ArrayList<AbstractCountry>list)
{
 int [] size = new int[6];  
 
 for(AbstractCountry i : list){
   int p = i.perigee;
   if(p < 0){
     abs(p);
   }
   if(p >= 0 && p < 550)
   {
     size[0]+=1;
   }
   else if(p >= 550 && p < 2500){
     size[1]++;
   }
   else if(p >= 2500 && p < 5000){
     size[2]++;
   }
   else if(p >= 5000 && p < 7500){
     size[3]++;
   }
   else if(p >= 7500 && p <= 10000){
     size[4]++;
   }
   else if(p > 10000 ){
     size[5]++;
   }
   
   
 }
  ArrayList<Integer> sum = new ArrayList<>(size.length);
        for (int i : size) {
            sum.add(i);
        }
        //println(sum.get(0));
 return sum;
}
 ArrayList<Integer> graphPerigee(ArrayList<AbstractCountry>list, Calendar begin, Calendar end)
{
   int [] size = new int[6];
  for(int index = 0; index < list.size(); index++ )
  {
    AbstractCountry object = list.get(index);
    Calendar date = object.launchDate;
    if( date.after(begin) && date.before(end) ) // if( beginOfInterval < launchDateOfObject < endOfInterval)
    {
   
   int p = object.perigee;
  
   if(p < 0){
     abs(p);
   }
   if(p >= 0 && p < 550)
   {
     size[0]+=1;
   }
   else if(p >= 550 && p < 2500){
     size[1]++;
   }
   else if(p >= 2500 && p < 5000){
     size[2]++;
   }
   else if(p >= 5000 && p < 7500){
     size[3]++;
   }
   else if(p >= 7500 && p <= 10000){
     size[4]++;
   }
   else if(p > 10000 ){
     size[5]++;
   }
  }
 }
 ArrayList<Integer> sum = new ArrayList<>(size.length);
        for (int i : size) {
            sum.add(i);
        }
        //println(sum.get(0));
 return sum;
}
ArrayList<Integer> graphApogee(ArrayList<AbstractCountry>list)
{
 int [] sizeOfApogee = new int[6];  
 
 for(AbstractCountry i : list){
   int a = i.apogee;
   
   if(a < 0){
     abs(a);
   }
   if(a >= 0 && a < 550)
   {
     sizeOfApogee[0]+=1;
   }
   else if(a >= 550 && a < 2500){
     sizeOfApogee[1]++;
   }
   else if(a >= 2500 && a < 5000){
     sizeOfApogee[2]++;
   }
   else if(a >= 5000 && a < 7500){
     sizeOfApogee[3]++;
   }
   else if(a >= 7500 && a <= 10000){
     sizeOfApogee[4]++;
   }
   else if(a > 10000 ){
     sizeOfApogee[5]++;
   }
   
 }
  ArrayList<Integer> sumOfApogee = new ArrayList<>(sizeOfApogee.length);
        for (int i : sizeOfApogee) {
            sumOfApogee.add(i);
        }
        //println(sumOfApogee.get(0));
 return sumOfApogee;
}
 ArrayList<Integer> graphApogee(ArrayList<AbstractCountry>list, Calendar begin, Calendar end)
{
   int [] sizeOfApogee = new int[6];
  for(int index = 0; index < list.size(); index++ )
  {
    AbstractCountry object = list.get(index);
    Calendar date = object.launchDate;
    if( date.after(begin) && date.before(end) ) // if( beginOfInterval < launchDateOfObject < endOfInterval)
    {
  
     int a = object.apogee;
   
   if(a < 0){
     abs(a);
   }
   if(a >= 0 && a < 550)
   {
     sizeOfApogee[0]+=1;
   }
   else if(a >= 550 && a < 2500){
     sizeOfApogee[1]++;
   }
   else if(a >= 2500 && a < 5000){
     sizeOfApogee[2]++;
   }
   else if(a >= 5000 && a < 7500){
     sizeOfApogee[3]++;
   }
   else if(a >= 7500 && a <= 10000){
     sizeOfApogee[4]++;
   }
   else if(a > 10000 ){
     sizeOfApogee[5]++;
   }
  }
 }
 ArrayList<Integer> sumOfApogee = new ArrayList<>(sizeOfApogee.length);
        for (int i : sizeOfApogee) {
            sumOfApogee.add(i);
        }
        //println(sumOfApogee.get(0));
 return sumOfApogee;
}
/*
  This method is implemeted by Nuoxi Zhang on 2022/03/23
  This method draws the display box.
  Renamed by Liam Zone
*/
void drawContainer(String title)
{
  if (title == null) title = "Error Null String"; // Null pointer Catch added by Liam Zone March 30th 2022
  //title = null;
  stroke(255);
  displayTitle(title);
  PShape top = createShape(LINE, 0, 75, SCREENWIDTH-1,75);
  top.setStroke(255);
  shape(top);
  PShape bottom = createShape(LINE, 0, 525, SCREENWIDTH-1, 525);
  bottom.setStroke(255);
  shape(bottom);
  PShape left = createShape(LINE, 0, 75, 0, 525);
  left.setStroke(255);
  shape(left);
  PShape right = createShape(LINE, SCREENWIDTH-1, 75, SCREENWIDTH-1, 525);
  right.setStroke(255);
  shape(right);
}
/*
  focusTextWidget() is implemented by Nuoxi Zhang on 2022/03/24
  This method takes in the two TextWidgets and mouseX and mouseY and return an object of TextWidget
  to and from shares the same EVENT_TEXT constant. The method is merely implemented to help find the
  TextWidget to focus on for the keyPressed() method.
*/
UI.TextWidget focusTextWidget(UI.TextWidget to, UI.TextWidget from, UI.TextWidget country, UI.TextWidget interval, int mx, int my)
{
   int event1 = to.getEvent(mx, my);
   int event2 = from.getEvent(mx,my);
   int event3 = country.getEvent(mx, my);
   int event4 = interval.getEvent(mx, my);
   if(event1 == EVENT_TEXT)
     return to;
   else if(event2 == EVENT_TEXT)
     return from;
   else if(event3 == EVENT_TEXT)
     return country;
   else if(event4 == EVENT_TEXT)
     return interval;
   else return null;
}

/*
  setTextBoxText() is implemented by Nuoxi Zhang on 23/03/2022.
  This methods is overwritten by Nuoxi Zhang on 30/03/2022.
  Set the labels of the 3 TextWidgets of the UI instance.
*/
void setTextBoxText(UI currentUI, String textOne, String textTwo, String textThree, String textFour)
{
  currentUI.toTextWidget.label = textOne;
  currentUI.fromTextWidget.label = textTwo;
  currentUI.countryTextWidget.label = textThree;
  currentUI.intervalTextWidget.label = textFour;
}

void addScreen(Screen newScreen){
  screenList.add(newScreen);
  switchScreen(newScreen);
  tabNav.updateTabs(screenList); 
}

void  switchScreen(Screen newScreen){ 
  Screen holdScreen = currentScreen;
  holdScreen.setActive(false);
  currentScreen = newScreen;
  newScreen.setActive(true);
}

void removeScreen(Screen oldScreen){
  if (oldScreen != currentScreen){
    
  } else {
    //switchScreen(screenList.get(0));
    
  }
}

void removeScreen(int ScreenID){
  
  if (screenList.get(ScreenID) != currentScreen && screenList.size()!=1){
    screenList.remove(ScreenID);
    
   tabNav.updateTabs(screenList);
  } else if (screenList.size()!=1) {
    if (ScreenID != 0){
      screenList.remove(ScreenID);
      switchScreen(screenList.get(ScreenID -1));
      /*if (ScreenID == screenList.size()-1){
      
      }
      */
      
    } else {
      //println("error");
      screenList.remove(ScreenID);
      switchScreen(screenList.get(0));
    }
    //switchScreen(screenList.get(0));
    tabNav.updateTabs(screenList);
  }
   
}


void displayTitle(String text)
{
  // Null pointer Catch added by Liam Zone March 30th 2022
  if (text != null){
    text(text, DEFAULT_X, 90);
  } else {
      text("Null String", DEFAULT_X, DEFAULT_Y_COORDINATE_OF_CHART_TITLE);
      println("NullPointerException in function displayTitle");
  }
  
}

/*
  This method is implemented by Nuoxi Zhang on 01/04/2022. 
*/
Calendar convertStringToDate(String input)
{
  SimpleDateFormat formatter = new SimpleDateFormat("yyyy MM dd");
   Calendar retValue = null;
   try
   {
      Date date = formatter.parse(input);
      Calendar cal = Calendar.getInstance();
      cal.setTime(date);
      retValue = cal;
   }
   catch(ParseException ex)
   {
     ex.printStackTrace();
   }
   return retValue;
}
/*
  This method is implemented by Nuoxi Zhang on 01/04/2022. 
*/
boolean isValidCountry(String s) throws InvalidCountryException
{
  if(s.equalsIgnoreCase("USA")||s.equalsIgnoreCase("China")||s.equalsIgnoreCase("Russia")||s.equalsIgnoreCase("Europe")
  ||s.equalsIgnoreCase("All")||s.equalsIgnoreCase("Other")) return true;
  //return true;
  throw new InvalidCountryException(s + " is not a valid country");
}
/*
  This method is implemented by Nuoxi Zhang on 01/04/2022. 
*/
boolean isValidDate(Calendar fromDate, Calendar toDate, String from, String to) throws InvalidToInputException, 
InvalidFromInputException, InvalidIntervalInputException, InvalidInputNullException
{
  if( fromDate == null || toDate == null ) throw new InvalidInputNullException("Invalid date format/Invalid date");
  Calendar lowerDate = convertStringToDate("1957 10 04");
  Calendar upperDate = convertStringToDate("2022 02 28");
  if(toDate.before(lowerDate))
    throw new InvalidToInputException(to + " is before 1957 10 04");
  if(toDate.after(upperDate))
    throw new InvalidToInputException(to + " is after 2022 02 28");
  if(fromDate.before(lowerDate))
    throw new InvalidFromInputException(from+ " is before 1957 10 04");
  if(fromDate.after(upperDate))
    throw new InvalidFromInputException(from + " is after 2022 02 28");
  if(fromDate.after(toDate))
    throw new InvalidFromInputException(from + " is after " + to);
  return true;
}
/*
  This method is implemented by Nuoxi Zhang on 01/04/2022. 
*/
int isDateIntervalValid(String s) throws InvalidIntervalInputException
{
  try{
    int num = Integer.parseInt(s);
    if(num > 0)
    {
      return num;
    }
    else throw new InvalidIntervalInputException("Interval must greater than zero");
  }catch(NumberFormatException ex)
  {
    throw new InvalidIntervalInputException("interval must be a positive\n number greater than 0");
  }
}
/*
  This method is implemented by Nuoxi Zhang on 01/04/2022. 
*/
String standardiseCountry(String s)
{
  if(s.equalsIgnoreCase("china"))
  {
    return "China";
  }
  else if(s.equalsIgnoreCase("usa"))
  {
    return "USA";
  }
  else if(s.equalsIgnoreCase("europe"))
  {
    return "Europe";
  } 
  else if (s.equalsIgnoreCase("all"))
  {
    return "All";
  }else
    return "Other";
}
/*
  This method is implemented by Nuoxi Zhang on 01/04/2022. 
  Modified by Nuoxi Zhang on 2022/04/10 to take into account larger max e.g. max > 10000
*/
int determineScale(ArrayList<Integer> list)
{
  if (list.size() != 0){ // (ROUGHLY CATCHES IMPORPER INTERVAL LENGTHS)
  int max = list.get(0);
  for( Integer num : list )
  {
    if(num > max)
      max = num;
  }
  if(max < 1000) return 3;
  else if(max >= 1000 && max <= 1500) return 4;
  else if( max > 1500 && max <= 2100) return 5;
  else if( max > 2100 && max <= 2600) return 7;
  else if ( max > 2600 && max <= 3600) return 9;
  else if( max> 3600 && max <= 5000) return 75;
  else if( max> 5000 && max <= 10000) return 120;
  else if( max> 10000 && max <= 12000) return 130;
  else if( max> 12000 && max <= 14000) return 140;
  else if( max> 14000 && max <= 16000) return 150;
  else return 200;
  }
  println("user inputted invalid interval");
  return 100;
}
/*
  This method is implemented by Nuoxi Zhang on 01/04/2022. 
*/
void eventDate(UI ui, int chartEvent) throws InvalidToInputException, 
InvalidFromInputException, InvalidIntervalInputException, InvalidInputNullException, InvalidCountryException,
NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException
{
  String from = ui.fromTextWidget.getLabel().trim();
  String to = ui.toTextWidget.getLabel().trim();
  String country = ui.countryTextWidget.getLabel().trim(); // Moved Standardizing country to appropriate place - LIam Zone
  String interval = ui.intervalTextWidget.getLabel().trim();
  Calendar fromDate = convertStringToDate(from);
  Calendar toDate = convertStringToDate(to);
  if(isValidDate(fromDate, toDate, from, to))
  {
    int intervalNum = isDateIntervalValid(interval);
    if(intervalNum > 0)
    {
      if(isValidCountry(country))
      {
        country = standardiseCountry(country);
        ArrayList<AbstractCountry> objects = dataMap.get(country);
        mergeSortDate(objects, objects.size());
        ArrayList<String> graphLabels = new ArrayList<String>();
        ArrayList<Integer> dataForChart = selectDate(objects,fromDate, toDate, 
        intervalNum, graphLabels);
        String title = String.format("Launches of Space Obejcts bewteen %s-%s in %d year interval from %s",
        from, to, intervalNum, country);
         
        if(chartEvent == EVENT_BAR)
        {
          BarChart chart  = new BarChart(title, dataForChart, DEFAULT_X, DEFAULT_Y, 70, graphLabels, determineScale(dataForChart));
          String tabTitle = country + " Date" + " Bar";
          chart.currentEvent = "Date"; // added by Nuoxi Zhang on 2022/04/10
          addScreen(new Screen(color(50), true, chart, tabTitle));
          //println("scale " + determineScale(dataForChart));
        }
        if(chartEvent == EVENT_LINE)
        {
          LineChart chart = new LineChart(title, dataForChart, DEFAULT_X, DEFAULT_Y, 70, graphLabels,determineScale(dataForChart));
          String tabTitle = country + " Date" + " Line";
          chart.currentEvent = "Date"; // added by Nuoxi Zhang on 2022/04/10
          addScreen(new Screen(color(50), true, chart, tabTitle));
        }
      }
    }
  }
  else
  {
    return;
  }
}

/*
  This method is implemented by Nuoxi Zhang on 01/04/2022. 
*/
boolean isValidMass(double fromMass, double toMass) throws InvalidInputNullException, InvalidFromInputException
{
  if((fromMass>=0 && fromMass <= 104420) && (toMass>=0 && toMass <= 104420))
  {
    if(fromMass < toMass)
    {
      if( fromMass == 0 && toMass == 0)
        throw new InvalidInputNullException("Mass cannot be both zero");
      else return true;
    }
    else throw new InvalidFromInputException("From mass must be less than the target mass");
  }
  throw new InvalidInputNullException("Both masses must be between 0-104420Kg");
  
}
/*
  This method is implemented by Nuoxi Zhang on 01/04/2022. 
*/
double convertStringToDouble(String s) throws InvalidIntervalInputException
{
  try
  {
    return Double.parseDouble(s);
  }
  catch(NumberFormatException ex)
  {
    throw new InvalidIntervalInputException("Input must be number");
  }
}
/*
  This method is implemented by Nuoxi Zhang on 01/04/2022. 
*/
double convertInterval(String s) throws InvalidIntervalInputException
{
  try
  {
    double num = Double.parseDouble(s);
    if(num <= 0)
      throw new InvalidIntervalInputException("Interval must be a real number\n greater than one");
    return num;
  }catch(NumberFormatException ex)
  {
    throw new InvalidIntervalInputException("Interval must be a real number");
  }
}
/*
  This method is implemented by Nuoxi Zhang on 01/04/2022. 
*/
int convertIntervalInteger(String s)throws InvalidIntervalInputException
{
  try
  {
    int num = Integer.parseInt(s);
    if(num <= 0)
      throw new InvalidIntervalInputException("Interval must be a natural number\n greater than one");
    return num;
  }catch(NumberFormatException ex)
  {
    throw new InvalidIntervalInputException("Interval must be an natural number");
  }
}
/*
  This method is implemented by Nuoxi Zhang on 01/04/2022. 
*/
void eventMass(UI ui, int chartEvent)throws InvalidToInputException, 
InvalidFromInputException, InvalidIntervalInputException, InvalidInputNullException, InvalidCountryException,
NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException
{
  String from = ui.fromTextWidget.getLabel().trim();
  String to = ui.toTextWidget.getLabel().trim();
  String country = ui.countryTextWidget.getLabel().trim(); 
  String interval = ui.intervalTextWidget.getLabel().trim();
  double fromMass = convertStringToDouble(from);
  double toMass = convertStringToDouble(to);
  if(isValidMass(fromMass,toMass))
  {
    double intervalNum = convertInterval(interval);
    if(intervalNum > 0)
    {
      if(isValidCountry(country))
      {
        country = standardiseCountry(country);
        ArrayList<AbstractCountry> objects = dataMap.get(country);
        mergeSort(objects, objects.size(), "mass"); 
        ArrayList<String> graphLabels = new ArrayList<String>();
        ArrayList<Integer> dataForChart = selectData(objects,fromMass, toMass, 
        intervalNum, graphLabels, "mass"); 
        String title = String.format("Space objects of mass %.2f -- %.2f kg at %.2f kg interval from %s", 
        fromMass, toMass,intervalNum, country);
         
        if(chartEvent == EVENT_BAR)
        {
          BarChart chart  = new BarChart(title, dataForChart, DEFAULT_X, DEFAULT_Y, 70, graphLabels, determineScale(dataForChart));
          String tabTitle = country + " Mass" + " Bar"; 
          chart.currentEvent = "Mass"; // added by Nuoxi Zhang on 2022/04/10
          addScreen(new Screen(color(50), true, chart, tabTitle));
          //println("scale " + determineScale(dataForChart));
        }
        if(chartEvent == EVENT_LINE)
        {
          LineChart chart = new LineChart(title, dataForChart, DEFAULT_X, DEFAULT_Y, 70, graphLabels,determineScale(dataForChart));
          String tabTitle = country + " Mass" + " Line";
          chart.currentEvent = "Mass"; // added by Nuoxi Zhang on 2022/04/10
          addScreen(new Screen(color(50), true, chart, tabTitle));
        }
      }
    }
  }
  else
  { 
    return;
  }
}


/*
  This method is implemented by Nuoxi Zhang on 01/04/2022. 
*/
boolean isValidApogee(int from, int to) throws InvalidInputNullException, InvalidFromInputException
{
  if((from>=0 && from <= 2147483647) && (to>=0 && to <= 2147483647))
  {
    if(from < to)
    {
      if( from == 0 && to == 0)
        throw new InvalidInputNullException("Apogee cannot be both zero");
      else return true;
    }
    else throw new InvalidFromInputException("From apogee must be less than the target mass");
  }
  throw new InvalidInputNullException("Both masses must be between\n 0-2147483647Km");
  
}
/*
  This method is implemented by Nuoxi Zhang on 01/04/2022. 
*/
void eventApogee(UI ui, int chartEvent) throws InvalidToInputException, 
InvalidFromInputException, InvalidIntervalInputException, InvalidInputNullException, InvalidCountryException,
NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException
{
  String from = ui.fromTextWidget.getLabel().trim();
  String to = ui.toTextWidget.getLabel().trim();
   String country = ui.countryTextWidget.getLabel().trim(); 
  String interval = ui.intervalTextWidget.getLabel().trim();
  int fromApogee = (int) convertStringToDouble(from);
  int toApogee = (int) convertStringToDouble(to);
  if(isValidApogee(fromApogee,toApogee))
  {
    int intervalNum = convertIntervalInteger(interval);
    if(intervalNum > 0)
    {
      if(isValidCountry(country))
      {
        country = standardiseCountry(country);
        ArrayList<AbstractCountry> objects = dataMap.get(country);
        mergeSort(objects, objects.size(), "apogee"); 
        ArrayList<String> graphLabels = new ArrayList<String>();
        ArrayList<Integer> dataForChart = selectData(objects,fromApogee, toApogee, 
        intervalNum, graphLabels, "apogee");
        String title = String.format("Space objects of Apogee between %d -- %d km in %d interval from %s", 
        fromApogee, toApogee,intervalNum, country);
         
        if(chartEvent == EVENT_BAR)
        {
          BarChart chart  = new BarChart(title, dataForChart, DEFAULT_X, DEFAULT_Y, 70, graphLabels, determineScale(dataForChart));
          String tabTitle = country + " Apogee" + " Bar";
          chart.currentEvent = "Apogee"; // added by Nuoxi Zhang on 2022/04/10
          addScreen(new Screen(color(50), true, chart, tabTitle));
          //println("scale " + determineScale(dataForChart));
        }
        if(chartEvent == EVENT_LINE)
        {
          LineChart chart = new LineChart(title, dataForChart, DEFAULT_X, DEFAULT_Y, 70, graphLabels,determineScale(dataForChart));
          String tabTitle = country + " Apogee" + " Line";
          chart.currentEvent = "Apogee"; // added by Nuoxi Zhang on 2022/04/10
          addScreen(new Screen(color(50), true, chart, tabTitle));
        }
      }
    }
    
  }
}

/*
  This method is implemented by Nuoxi Zhang on 01/04/2022. 
*/
boolean isValidPerigee(int from, int to)throws InvalidInputNullException, InvalidFromInputException
{
  if((from>=0 && from <= 2147483647) && (to>=0 && to <= 2147483647))
  {
    if(from < to)
    {
      if( from == 0 && to == 0)
        throw new InvalidInputNullException("Perigee cannot be both zero");
      else return true;
    }
    else throw new InvalidFromInputException("From Perigee must be less than the target mass");
  }
  throw new InvalidInputNullException("Both masses must be between\n 0-2147483647Km");
}

/*
  This method is implemented by Nuoxi Zhang on 01/04/2022. 
*/
void eventPerigee(UI ui, int chartEvent) throws InvalidToInputException, 
InvalidFromInputException, InvalidIntervalInputException, InvalidInputNullException, InvalidCountryException,
NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException
{
  String from = ui.fromTextWidget.getLabel().trim();
  String to = ui.toTextWidget.getLabel().trim();
  String country = ui.countryTextWidget.getLabel().trim(); 
  String interval = ui.intervalTextWidget.getLabel().trim();
  int fromPerigee = (int) convertStringToDouble(from);
  int toPerigee = (int) convertStringToDouble(to);
  if(isValidApogee(fromPerigee,toPerigee))
  {
    int intervalNum = convertIntervalInteger(interval);
    if(intervalNum > 0)
    {
      if(isValidCountry(country))
      {
        country = standardiseCountry(country);
        ArrayList<AbstractCountry> objects = dataMap.get(country);
        mergeSort(objects, objects.size(), "perigee"); 
        ArrayList<String> graphLabels = new ArrayList<String>();
        ArrayList<Integer> dataForChart = selectData(objects,fromPerigee, toPerigee, 
        intervalNum, graphLabels, "perigee");
        String title = String.format("Space objects of Perigee between %d -- %d km in %d interval from %s", 
        fromPerigee, toPerigee,intervalNum, country);
         
        if(chartEvent == EVENT_BAR)
        {
          BarChart chart  = new BarChart(title, dataForChart, DEFAULT_X, DEFAULT_Y, 70, graphLabels, determineScale(dataForChart));
          String tabTitle = country + " Perigee" + " Bar";
          chart.currentEvent = "Perigee"; // added by Nuoxi Zhang on 2022/04/10
          addScreen(new Screen(color(50), true, chart, tabTitle));
          //println("scale " + determineScale(dataForChart));
        }
        if(chartEvent == EVENT_LINE)
        {
          LineChart chart = new LineChart(title, dataForChart, DEFAULT_X, DEFAULT_Y, 70, graphLabels,determineScale(dataForChart));
          String tabTitle = country + " Perigee" + " Line";
          chart.currentEvent = "Perigee"; // added by Nuoxi Zhang on 2022/04/10
          addScreen(new Screen(color(50), true, chart, tabTitle));
        }
      }
    }
  }
}
/*
  This method is implemented by Nuoxi Zhang on 01/04/2022. 
*/
ArrayList<Integer> selectDiameter(ArrayList<AbstractCountry> list, double begin, double maxDiameter, double interval, ArrayList<String> labels) 
{
  ArrayList<Integer> retValue = new ArrayList<Integer>();
  int counter = 0;
  double endOfInterval = begin + interval;
  for (int index = 0; index < list.size(); index++) 
  {
    AbstractCountry object = list.get(index);
    double objDiameter = Math.round(object.diameter*100)/100;//*
    if (objDiameter >= begin && objDiameter <= endOfInterval) 
    {
      counter++;
    }
    else if (objDiameter > endOfInterval) 
    {
      String label = begin + "-" + endOfInterval + "M";
      retValue.add(counter);
      labels.add(label);
      begin+=interval;                  
      endOfInterval+=interval;
      if (begin >= maxDiameter) 
      {
        break;
      }
      if (endOfInterval >= maxDiameter)
      {
        endOfInterval = maxDiameter;
      }
      counter = 1;
    }
  }
  return retValue;
}
/*
  This method is implemented by Nuoxi Zhang on 01/04/2022. 
*/
boolean isValidDiameter(double from, double to) throws InvalidInputNullException, InvalidFromInputException
{
  if( ( from >= 0 && from <= 41.0 ) && ( to >= 0 && to <= 41.0 ) )
  {
    if(from < to)
    {
      if( from == 0 && to == 0)
        throw new InvalidInputNullException("Diameter cannot be both zero");
      else return true;
    }
    else throw new InvalidFromInputException("From Diamter must be less than the target mass");
  }
  throw new InvalidInputNullException("Both diamters must be between\n 0-41 Metres");
}
/*
  This method is implemented by Nuoxi Zhang on 01/04/2022. 
*/
void eventDiameter(UI ui, int chartEvent) throws InvalidToInputException, 
InvalidFromInputException, InvalidIntervalInputException, InvalidInputNullException, InvalidCountryException,
NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException
{
  String from = ui.fromTextWidget.getLabel().trim();
  String to = ui.toTextWidget.getLabel().trim();
  String country = ui.countryTextWidget.getLabel().trim(); 
  String interval = ui.intervalTextWidget.getLabel().trim();
  double fromDiameter =  convertStringToDouble(from);
  double toDiameter =  convertStringToDouble(to);
  if(isValidDiameter(fromDiameter,toDiameter))
  {
    double intervalNum = convertInterval(interval);
    if(intervalNum > 0)
    {
      if(isValidCountry(country))
      {
        country = standardiseCountry(country);
        ArrayList<AbstractCountry> objects = dataMap.get(country);
        mergeSort(objects, objects.size(), "diameter");
        ArrayList<String> graphLabels = new ArrayList<String>();
        //ArrayList<Integer> dataForChart = selectDiameter(objects,fromDiameter, toDiameter, 
        //intervalNum, graphLabels);
        ArrayList<Integer> dataForChart = selectData(objects,fromDiameter, toDiameter, 
        intervalNum, graphLabels, "diameter");
        String title = String.format("Space objects of Diameter between %.2f -- %.2f km in %.2f interval from %s", 
        fromDiameter, toDiameter,intervalNum, country);
         
        if(chartEvent == EVENT_BAR)
        {
          BarChart chart  = new BarChart(title, dataForChart, DEFAULT_X, DEFAULT_Y, 70, graphLabels, determineScale(dataForChart));
          String tabTitle = country + " Diameter" + " Bar";
          chart.currentEvent = "Diameter"; // added by Nuoxi Zhang on 2022/04/10
          addScreen(new Screen(color(50), true, chart, tabTitle));
          //println("scale " + determineScale(dataForChart));
        }
        if(chartEvent == EVENT_LINE)
        {
          LineChart chart = new LineChart(title, dataForChart, DEFAULT_X, DEFAULT_Y, 70, graphLabels,determineScale(dataForChart));
          String tabTitle = country + " Diameter" + " Line";
          chart.currentEvent = "Diameter"; // added by Nuoxi Zhang on 2022/04/10
          addScreen(new Screen(color(50), true, chart, tabTitle));
        }
      }
    }
  }
}
/*
  This method is implemented by Nuoxi Zhang on 01/04/2022. 
*/
void setTextBoxes(UI ui, int event)
{
  if(event ==EVENT_DATE)
    setTextBoxText(ui, "2022 02 28", "1957 10 04", "Country", "Interval");
  else if(event == EVENT_MASS)
    setTextBoxText(ui, "104420 KG", "0 KG", "Country", "Interval");
  else if(event == EVENT_PERIGEE)
    setTextBoxText(ui, "2147483647KM", "0 KM", "Country", "Interval");
  else if(event == EVENT_APOGEE)
    setTextBoxText(ui, "2147483647KM", "0 KM", "Country", "Interval");
  else if(event == EVENT_DIAMETER)
    setTextBoxText(ui, "41 M", "0 M", "Country", "Interval");
  else
    return;
}
/*
  This method is implemented by Nuoxi Zhang on 01/04/2022. 
*/
void setGuidingMessage(UI ui, int event)
{
  if(event == EVENT_DATE)
    ui.display.guide = guideMessageDate;
  else if(event == EVENT_MASS)
    ui.display.guide = guideMessageMass;
  else if(event == EVENT_APOGEE)
    ui.display.guide = guideMessageApogee;
  else if(event == EVENT_PERIGEE)
    ui.display.guide = guideMessagePerigee;
  else if(event == EVENT_DIAMETER)
    ui.display.guide = guideMessageDiameter;
  else return;
}

/*
  IMPORTANT NOTE: The following 4 following methods: mergeSort() and merge(), mergeSortDate()
  and merge()(method overload) was COPIED from the website
  https://www.geeksforgeeks.org/iterative-merge-sort/, the article was written by Shivam Agrawal.
  The author of the article is using the material in this pdf: https://csg.sph.umich.edu/abecasis/class/2006/615.09.pdf
  
  
  mergeSort() and merge() was copied and modified by Nuoxi Zhang on 2022/04/07.
  I used reflection to make the merge sort more general. The user pass in the ArrayList to-be-sorted and the size of the
  ArrayList as well as the name of the desiredField as String.
  mergeSortDate() and merge() (method overload) was copied and modified by Nuoxi Zhang on 2022/04/10 to 
  sort the Calendar attribute of each object.
  
*/
void mergeSort(ArrayList<AbstractCountry> list, int n, String desiredField) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException
{
     
    int currentSize;
    int leftStartIndex;
                     
    for (currentSize = 1; currentSize <= n-1;
        currentSize = 2*currentSize)
    {
        for (leftStartIndex = 0; leftStartIndex < n-1;
            leftStartIndex += 2*currentSize)
        {
            int mid = Math.min(leftStartIndex + currentSize - 1, n-1);
            int right_end = Math.min(leftStartIndex
                         + 2*currentSize - 1, n-1);
            merge(list, leftStartIndex, mid, right_end, desiredField);
        }
    }
}
 
void merge(ArrayList<AbstractCountry> arr, int l, int m, int r, String desiredField) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException
{
    int i, j, k;
    int leftArraySize = m - l + 1;
    int rightArraySize = r - m;
 
    AbstractCountry tempLeft[] = new AbstractCountry[leftArraySize];
    AbstractCountry tempRight[] = new AbstractCountry[rightArraySize];

    for (i = 0; i < leftArraySize; i++)
      tempLeft[i] = arr.get(l + i);
    for (j = 0; j < rightArraySize; j++)
      tempRight[j] = arr.get(m + 1+ j);

    i = 0;
    j = 0;
    k = l;
    while (i < leftArraySize && j < rightArraySize)
    {

      AbstractCountry leftObject = tempLeft[i];
      Class<?> classOfLeftObj = leftObject.getClass();
      Field leftField = classOfLeftObj.getField(desiredField);
      //leftField.setAccessible(true);
      Double leftValue = Math.abs(Double.valueOf(leftField.get(leftObject).toString()));
      
      AbstractCountry rightObject = tempRight[j];
      Class<?> classOfrightObj = rightObject.getClass();
      Field rightField = classOfrightObj.getField(desiredField);
      //rightField.setAccessible(true);
      Double rightValue = Math.abs(Double.valueOf(rightField.get(rightObject).toString()));

      if(leftValue <= rightValue)
        {
          arr.remove(k);
          arr.add(k, tempLeft[i]);
          i++;
        }
        else
        {
          arr.remove(k);
          arr.add(k, tempRight[j]);
          j++;
        }
        k++;
    }

    while (i < leftArraySize)
    {
      arr.remove(k);
      arr.add(k, tempLeft[i]);
      i++;
      k++;
    }

    while (j < rightArraySize)
    {
      arr.remove(k);
      arr.add(k, tempRight[j]);
      j++;
      k++;
    }
}

void mergeSortDate(ArrayList<AbstractCountry> list, int n)
{     
    int currentSize;
    int leftStartIndex;
                     
    for (currentSize = 1; currentSize <= n-1;
        currentSize = 2*currentSize)
    {
        for (leftStartIndex = 0; leftStartIndex < n-1;
            leftStartIndex += 2*currentSize)
        {
            int mid = Math.min(leftStartIndex + currentSize - 1, n-1);
            int right_end = Math.min(leftStartIndex
                         + 2*currentSize - 1, n-1);
            merge(list, leftStartIndex, mid, right_end);
        }
    }
}
void merge(ArrayList<AbstractCountry> arr, int l, int m, int r)
{
    int i, j, k;
    int leftArraySize = m - l + 1;
    int rightArraySize = r - m;
 
    AbstractCountry tempLeft[] = new AbstractCountry[leftArraySize];
    AbstractCountry tempRight[] = new AbstractCountry[rightArraySize];

    for (i = 0; i < leftArraySize; i++)
      tempLeft[i] = arr.get(l + i);
    for (j = 0; j < rightArraySize; j++)
      tempRight[j] = arr.get(m + 1+ j);

    i = 0;
    j = 0;
    k = l;
    while (i < leftArraySize && j < rightArraySize)
    {
      Calendar leftValue = tempLeft[i].launchDate;
      Calendar rightValue = tempRight[j].launchDate;
      
      if(!leftValue.after(rightValue))
        {
          arr.remove(k);
          arr.add(k, tempLeft[i]);
          i++;
        }
        else
        {
          arr.remove(k);
          arr.add(k, tempRight[j]);
          j++;
        }
        k++;
    }

    while (i < leftArraySize)
    {
      arr.remove(k);
      arr.add(k, tempLeft[i]);
      i++;
      k++;
    }

    while (j < rightArraySize)
    {
      arr.remove(k);
      arr.add(k, tempRight[j]);
      j++;
      k++;
    }
}

/*
  selectData() method is implemented by Nuoxi Zhang on 2022/04/07.
  This method is implemented to reduce code duplication in our code.
  This method replaces selectMass(), selectPerigee(), selectApogee() and selectDiameter() using Reflection.
  All the user need is to pass in a String consisting the name of the desiredField
  
  
  Modification: This method is modified by Nuoxi Zhang on 2022/04/10
  Removed unit from the label as we have legend to show the unit.
  For value larget than 1000, the program is going to use K in the label. Eg. 5000000 will become 5000K
  This is done to shorten the length of the labels.
  Small bug was resolved. The bug was not including the last counter and label when the end value,
  this is because I forgot to add them after the loop finishes.
  
*/
ArrayList<Integer> selectData(ArrayList<AbstractCountry> list, double begin, double max, double interval, 
    ArrayList<String> labels, String desiredField) throws NoSuchFieldException, SecurityException, NumberFormatException, IllegalArgumentException, IllegalAccessException 
{
  /*String unitForLabel = "KG";
  if(desiredField.equalsIgnoreCase("apogee") || desiredField.equalsIgnoreCase("perigee"))
  {
    unitForLabel = "KM";
  }
  if(desiredField.equalsIgnoreCase("diameter"))
  {
    unitForLabel = "M";
  }*/
  ArrayList<Integer> retValue = new ArrayList<Integer>();
  int counter = 0;
  double endOfInterval = begin + interval;
  int size = 0;
  for (int index = 0; index < list.size(); index++) 
  {
    size++;
    AbstractCountry object = list.get(index);
    Class<?> objectClass = object.getClass();
    Field field = objectClass.getField(desiredField);
    field.setAccessible(true);
    
    double value = Math.abs(Double.valueOf(field.get(object).toString()));//*
    if (value >= begin && value <= endOfInterval)  
    {
      counter++;
    }
    else if (value > endOfInterval) 
    {
      String beginLabel = ""+ begin;
      String endLabel = ""+endOfInterval;
      if(begin/1000 >= 1)
        beginLabel = String.format("%.1f", begin/1000.0) + "K";
      if(endOfInterval/1000 >= 1)
        endLabel =  String.format("%.1f",endOfInterval/1000) + "K";
      String label = beginLabel + "-" + endLabel;
      retValue.add(counter);
      labels.add(label);
      begin+=interval;                  
      endOfInterval+=interval;
      if (begin >= max) 
      {
        break;
      }
      if (endOfInterval >= max)
      {
        endOfInterval = max;
      }
      counter = 1;
    }
  }
  /*
  Code added to include the counter and label after the loop finishes(if there's any)-Nuoxi Zhang on 2022/04/10
  /*/
  if( size == list.size() )
  {
    String beginLabel = ""+ begin;
    String endLabel = ""+endOfInterval;
    if(begin/1000 >= 1)
      beginLabel =  String.format("%.1f",begin/1000) + "K";
    if(endOfInterval/1000 >= 1)                                      
      endLabel =  String.format("%.1f",endOfInterval/1000) + "K";
    String label = beginLabel + "-" + endLabel;
    retValue.add(counter);
    labels.add(label);
  }
  return retValue;
}
/* Method selectMass() is implemented by Mykhailo Bitiutskyy on 23/03/2022
This method is made similar to the one above in order to make it easier to maintain and modify.
However, it is still not working properly and needs a number of fixes.
  Fixed by Nuoxi Zhang 2022/03/24. Only modified places with *. And also changed < and > operators to <= and >=.
*/

ArrayList<Integer> selectMass(ArrayList<AbstractCountry> list, double begin, double maxMass, double interval, ArrayList<String> labels) 
{
  ArrayList<Integer> retValue = new ArrayList<Integer>();
  //double objMass = 0;
  int counter = 0;
  double endOfInterval = begin + interval;
  for (int index = 0; index < list.size(); index++) 
  {
    AbstractCountry object = list.get(index);
    double objMass = object.mass;//*
    if (objMass >= begin && objMass <= endOfInterval) 
    {
      counter++;
    }
    else if (objMass > endOfInterval) 
    {
      String beginLabel = ""+ begin;
      String endLabel = ""+endOfInterval;
      if(begin/1000 > 1)
        beginLabel = ((int)begin/1000) + "K";
      if(endOfInterval/1000 > 1)
        endLabel = ((int)endOfInterval/1000) + "K";
      String label = beginLabel + "-" + endLabel;
      retValue.add(counter);
      labels.add(label);
      begin+=interval;                  
      endOfInterval+=interval;
      if (begin >= maxMass) 
      {
        break;
      }
      if (endOfInterval >= maxMass)
      {
        endOfInterval = maxMass;
      }
      counter = 1;
    }
  }
  //String beginLabel = ""+ begin;
  //String endLabel = ""+endOfInterval;
  //if(begin/1000 > 1)
  //  beginLabel = ((int)begin/1000) + "K";
  //if(endOfInterval/1000 > 1)
  //  endLabel = ((int)endOfInterval/1000) + "K";
  //String label = beginLabel + "-" + endLabel;
  //retValue.add(counter);
  //labels.add(label);
  return retValue;
}
/*
 Method selectDate() is implemented by Nuoxi Zhang on 2022/03/22
 This method return an ArrayList of integer of the number of space object by a certain country launched during a 
 period define by begin and end per interval years. 
 For example, if begin is 2000 01 01, end is 2020 01 01, then the intervals are: 2000 - 2005, 2005-2010, 2010-2015
 2015-2020. The return ArrayList will contain 4 integers.
 The method also take in an empty ArrayList<String>, since Java is pass-by-value (i.e. address of the object is passed in)
 If I modify it, it will changed even outside the function.
 
 UPDATE: This method is modified by Nuoxi Zhang on 2022/04/10
 Small bug was resolved. The bug was not including the last counter and label when the end date is 2022 02 28,
 this is because I forgot to add them after the loop finishes.
 Also changed date.before(anotherDate) and date.after(anotherDate) to date.compareTo(anotherDate) so that the algorithm //<>//
 will not leave out date that are the same as anotherDate.
/*/
ArrayList<Integer> selectDate(ArrayList<AbstractCountry> list, Calendar begin, Calendar end, int interval, ArrayList<String> labels) //<>//
{
  ArrayList<Integer> retValue = new ArrayList<Integer>();
  
  Calendar endOfInterval = (Calendar) begin.clone(); // clone() is used so that endOfInterval and begin not pointing at same object
  endOfInterval.add(Calendar.YEAR, interval);// e.g. begin is 2000, and interval is 5, then endOfInterval is now modified to 2005
  int counter = 0;
  int size = 0;
  for(int index = 0; index < list.size(); index++ )
  {
    AbstractCountry object = list.get(index);
    Calendar date = object.launchDate;
    size++;
    if((date.compareTo(begin) >= 0) && (date.compareTo(endOfInterval) <= 0))
    {
      counter++;
    }
    else if(date.compareTo(end) > 0)
    {
      String label = begin.get(Calendar.YEAR) + "-" + endOfInterval.get(Calendar.YEAR);
      retValue.add(++counter);
      labels.add(label);
      Calendar copyOfEnd = (Calendar)endOfInterval.clone();
      begin = copyOfEnd; // begin became the old endOfInterval
      endOfInterval.add(Calendar.YEAR, interval); // endOfInterval += interval years.
      break;
    }
    else if(date.compareTo(endOfInterval) > 0)// if (launchDateOfObject > endOfInterval) meaning that we need to change begin and endOfInterval
    {
      String label = begin.get(Calendar.YEAR) + "-" + endOfInterval.get(Calendar.YEAR);
      retValue.add(counter);
      labels.add(label);
      Calendar copyOfEnd = (Calendar)endOfInterval.clone();
      begin = copyOfEnd; // begin became the old endOfInterval
      endOfInterval.add(Calendar.YEAR, interval); // endOfInterval += interval years.
      //if(begin
      
      if(endOfInterval.after(end))
      {
        endOfInterval = (Calendar) end.clone();
      }
      counter = 1; // counting the current space object that is been examined
    }
  }
  // the following 3 lines were added by Nuoxi Zhang on 2022/04/10
  if(size == list.size())
  {
    String label = begin.get(Calendar.YEAR) + "-" + endOfInterval.get(Calendar.YEAR);
    retValue.add(++counter);
    labels.add(label);
  }
  return retValue;
} 
/*
  This method is implemented by Nuoxi Zhang on 2022/04/08
  This method checks if the text box is been pressed, when it detect a text box is been pressed this method
  clears the text box for the user so that the user do not need to delete the text first and then type in their
  quiry.
*/
void clearBoxForTyping(UI.TextWidget currentTextWidget)
{ 
  if(currentTextWidget == null) return;
  if(currentTextWidget.label.equalsIgnoreCase("Country") || currentTextWidget.label.equalsIgnoreCase("Interval")
  ||currentTextWidget.label.equalsIgnoreCase("104420 KG") ||currentTextWidget.label.equalsIgnoreCase("0 KG") ||
  currentTextWidget.label.equalsIgnoreCase("2147483647KM") ||currentTextWidget.label.equalsIgnoreCase("0 KM")||
  currentTextWidget.label.equalsIgnoreCase("41 M")|| currentTextWidget.label.equalsIgnoreCase("0 M")
  ||currentTextWidget.label.equalsIgnoreCase("2022 02 28")||currentTextWidget.label.equalsIgnoreCase("1957 10 04"))
  {
    currentTextWidget.label = "";
  }
}


/* Method implemted by Mykhailo Bitiutskyy on 05/04/2022.
  Modified by Nuoxi Zhang on 2022/04/13
*/
void barClick (ArrayList<Chart> chart, int mouse_x, int mouse_y, UI ui, int event) throws NoSuchFieldException,
IllegalAccessException{
  //boolean clickedBar = false;
  if( event == EVENT_NULL ) return;
  int count = 0;
  Bar targetedBar = new Bar();
  try
  {
    BarChart currentChart = (BarChart)chart.get(0);
    ArrayList<Bar> bars = currentChart.getBar();
    for (count = 0; count < bars.size(); count++) {
      Bar currentBar = bars.get(count);
      if (mouse_x >= currentBar.xpos && mouse_x <= currentBar.xpos + currentBar.barWidth 
      && mouse_y <= currentBar.ypos && mouse_y >= currentBar.ypos + -(currentBar.value/currentBar.scaleFactor)) { 
        targetedBar = currentBar;
        break;
      }
    }
    String intervalRead = targetedBar.label;
    double min = 0.0;
    double max = 0.0;
    String[] arr = {};
    arr = intervalRead.split("-");
    try
    {
      min = Double.valueOf(arr[0]);  
    }catch(NumberFormatException ex)
    {
      try
      {
        String newStr = arr[0].substring(0, arr[0].length()-1);
        min = Double.valueOf(newStr)*1000.0;
      }
      catch(NumberFormatException e)
      {
      }
    }
    try
    {
      max = Double.valueOf(arr[1]);
    }catch(NumberFormatException ex)
    {
      try{
        String newStr = arr[1].substring(0, arr[1].length()-1);
        max = Double.valueOf(newStr)*1000.0;
      }catch(NumberFormatException e)
      {
      }
    }
    println("min " + min);
    println("max " + max);
    
    String desiredField = determineEvent(event);
    println("desired Field" + desiredField);
    if( desiredField.equals(null) ) return;
    double interval = (max - min)/5.0;
    println("interval " + interval );
    String countryName  = standardiseCountry(ui.countryTextWidget.label);
    ArrayList<AbstractCountry> list = dataMap.get(countryName); 
    mergeSort(list, list.size(), desiredField); 
    ArrayList<String> labels = new ArrayList<>();
    ArrayList<Integer> dataForChart = selectData(list, min, max, interval, labels, desiredField);
    String title = "";

    if( event == EVENT_MASS)
      title = String.format("Space objects of mass %.2f -- %.2f kg at %.2f kg interval from %s", 
        min, max,interval, countryName);
    else if( event == EVENT_PERIGEE )
      title = String.format("Space objects of Perigee between %.2f -- %.2f km in %.2f interval from %s", 
        min, max,interval, countryName);
    else if( event == EVENT_APOGEE )
      title = String.format("Space objects of Apogee between %.2f -- %.2f km in %.2f interval from %s", 
        min, max,interval, countryName);
    else if( event == EVENT_DIAMETER )
      title = String.format("Space objects of Diameter between %.2f -- %.2f M in %.2f interval from %s", 
        min, max,interval, countryName);
    BarChart chartToBeUsed  = new BarChart(title, dataForChart, DEFAULT_X, DEFAULT_Y, 70, labels, determineScale(dataForChart));
    String tabTitle = countryName + " " + desiredField + " Bar";
    chartToBeUsed.currentEvent = desiredField;
    addScreen(new Screen(color(50), true, chartToBeUsed, tabTitle));
  }
  catch(NullPointerException|IndexOutOfBoundsException|ClassCastException ex)
  {
    println("Null pointer occured in barClick method");  
  }
}

/*
  This method was implemented by Nuoxi Zhang on 2022/04/13
*/
String determineEvent(int event)
{
  if( event == EVENT_MASS )
    return "mass";
  else if( event == EVENT_PERIGEE )
    return "perigee";
  else if( event == EVENT_APOGEE )
    return "apogee";
  else if( event == EVENT_DIAMETER )
    return "diameter";
  else return null;
}


/*

*/
//void displayLegend(String currentEvent)
//{
//  String unit = "KM";
//  if(currentEvent.equalsIgnoreCase("diameter")) unit = "M";
//  if(currentEvent.equalsIgnoreCase("mass")) unit = "KG";
//  fill(colourWhite);
//  text("Y-Axis: Frequency", SCREENWIDTH - 200, DEFAULT_Y_COORDINATE_OF_CHART_TITLE);
//  text("X-Axis: "+ currentEvent + "(" + unit + ")", SCREENWIDTH - 200, DEFAULT_Y_COORDINATE_OF_CHART_TITLE + 20 );
//}
/*
  This method is implemented by Nuoxi Zhang on 01/04/2022. 
*/
//ArrayList<Integer> selectPerigee(ArrayList<AbstractCountry> list, int begin, int maxPerigee, int interval, ArrayList<String> labels) 
//{
//  ArrayList<Integer> retValue = new ArrayList<Integer>();
//  int counter = 0;
//  double endOfInterval = begin + interval;
//  for (int index = 0; index < list.size(); index++) 
//  {
//    AbstractCountry object = list.get(index);
//    int objPerigee = abs(object.perigee);//*
//    if (objPerigee >= begin && objPerigee <= endOfInterval) 
//    {
//      counter++;
//    }
//    else if (objPerigee > endOfInterval) 
//    {
//      String label = begin + "-" + endOfInterval + "km";
//      retValue.add(counter);
//      labels.add(label);
//      begin+=interval;                  
//      endOfInterval+=interval;
//      if (begin >= maxPerigee) 
//      {
//        break;
//      }
//      if (endOfInterval >= maxPerigee)
//      {
//        endOfInterval = maxPerigee;
//      }
//      counter = 1;
//    }
//  }
//  return retValue;
//}
/*
  This method is implemented by Nuoxi Zhang on 01/04/2022. 
*/
/*ArrayList<Integer> selectApogee(ArrayList<AbstractCountry> list, int begin, int maxApogee, int interval, ArrayList<String> labels) 
{
  ArrayList<Integer> retValue = new ArrayList<Integer>();
  int counter = 0;
  double endOfInterval = begin + interval;
  for (int index = 0; index < list.size(); index++) 
  {
    AbstractCountry object = list.get(index);
    int objApogee = abs(object.apogee);//*
    if (objApogee >= begin && objApogee <= endOfInterval) 
    {
      counter++;
    }
    else if (objApogee > endOfInterval) 
    {
      String label = begin + "-" + endOfInterval + "km";
      retValue.add(counter);
      labels.add(label);
      begin+=interval;                  
      endOfInterval+=interval;
      if (begin >= maxApogee) 
      {
        break;
      }
      if (endOfInterval >= maxApogee) //*
      {
        endOfInterval = maxApogee;
      }
      counter = 1;
    }
  }
  return retValue;
}*/
/*
  This method is implemented by Nuoxi Zhang on 01/04/2022. 
*/
/*ArrayList<Integer> selectDiameter(ArrayList<AbstractCountry> list, double begin, double maxDiameter, double interval, ArrayList<String> labels) 
{
  ArrayList<Integer> retValue = new ArrayList<Integer>();
  int counter = 0;
  double endOfInterval = begin + interval;
  for (int index = 0; index < list.size(); index++) 
  {
    AbstractCountry object = list.get(index);
    double objDiameter = Math.round(object.diameter*100)/100;//*
    if (objDiameter >= begin && objDiameter <= endOfInterval) 
    {
      counter++;
    }
    else if (objDiameter > endOfInterval) 
    {
      String label = begin + "-" + endOfInterval + "M";
      retValue.add(counter);
      labels.add(label);
      begin+=interval;                  
      endOfInterval+=interval;
      if (begin >= maxDiameter) 
      {
        break;
      }
      if (endOfInterval >= maxDiameter)
      {
        endOfInterval = maxDiameter;
      }
      counter = 1;
    }
  }
  return retValue;
}*/
