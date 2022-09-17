//<<<<<<< .mine
//import java.text.SimpleDateFormat;
//import java.time.*;
//import java.time.format.DateTimeFormatter;
//import java.util.Date;
//import java.util.Calendar;
//import java.lang.reflect.*;
//import java.lang.*;
//import java.util.ArrayList;
//import java.util.Arrays;
//import java.text.ParseException;

/////////////////// Pre-Set BarCharts/LineCharts ////////////////
//BarChart testUSAByDate;
//BarChart testEUByDate;
//BarChart testCountriesByDate;
//BarChart testEUmass;
//BarChart testTotalLaunches;
//BarChart testUSAApogee;
//BarChart testCountriesApogee;
//BarChart testUSAPerigee;
//BarChart testCountriesPerigee;
//LineChart testEUDateLine;
//pieChart p = new pieChart();
//ScatterPlot testEmptyScatter;
////String countryName;
////////////////////////////////////////////////////


//UI controller;
//UI.TextWidget textBoxToBeEdited;

////
//UI.CheckBox dateBox, massBox, apogeeBox, perigeeBox;



//final int SCREENWIDTH = 1600; // used in main
//final int SCREENHEIGHT = 1000; // used in main
//PFont stdFont;

//Table tableData;

//final int DEFAULT_X = 15; // used in generateBarchart
//final int DEFAULT_Y = 500;// used in generateBarchart
//final int DISPLAYHEIGHT = 450;  
//final int DISPLAYWIDTH = SCREENWIDTH-1;
//final String[] countryNameArray = {"China", "EU", "USA", "Russia/SU","Other", "All"}; // make this adaptable (IE Soviet Union / not every country )
//final int DEFAULT_Y_COORDINATE_OF_CHART_TITLE = 90;
//ArrayList<String> countryNameList = new ArrayList<String>(Arrays.asList(countryNameArray));
//ArrayList<String> details = new ArrayList<String>();
//ArrayList<AbstractCountry> countries = new ArrayList<>();
//ArrayList<AbstractCountry> Value = new ArrayList<AbstractCountry>();
//ArrayList<AbstractCountry> informat = new ArrayList<AbstractCountry>();
//color text,bottom ,back, select;
//int a, b, c, d, e, f,limit;
//float totalWidthOfBars = 0;
//search s = new search();
//TextWidget newSearch;
//String result = "";
//int screenNumber;
//float textScroll;
//double [] count; // for automatic adaption of margin width
//TextBox info;
//int event1;




/////////////// Event constants ////////
//final int EVENT_TEXT = 1;
//final int EVENT_DATE = 2;
//final int EVENT_MASS = 3;
//final int EVENT_APOGEE = 4;
//final int EVENT_PERIGEE = 5;
//final int EVENT_ENTER = 6;
//final int EVENT_CLEAR = 7;
//final int EVENT_BAR = 8;
//final int EVENT_LINE = 9;
//final int EVENT_DIAMETER = 10;
////////////////////////////////////////
//final int DISTANCE_BETWEEN_BARS = 6;


////////////////////// variables for tab functionality /////////////////////////////
//ArrayList<Screen> screenList = new ArrayList<>();
//final int SCREEN_NULL=-1; //for null screens
//final int SCREEN_DELETE=-2; //to delete screen
//final int EVENT_NULL=0; //for null widgets
//Screen currentScreen;
//TabNavigator tabNav = new TabNavigator();
//boolean mouseHold = false;
//////////////////////////////////////////////////////////////////////


////////////////////// list of countries /////////////////////////////////
//ArrayList<AbstractCountry> earthList = new ArrayList<>();
//ArrayList<AbstractCountry> chinaList = new ArrayList<>();
//ArrayList<AbstractCountry> russiaList = new ArrayList<>();
//ArrayList<AbstractCountry> euList = new ArrayList<>();
//ArrayList<AbstractCountry> usaList = new ArrayList<>();
//ArrayList<AbstractCountry> otherList = new ArrayList<>();
//ArrayList<AbstractCountry> List = new ArrayList<>();
//ArrayList<Bar> totalPerCountryChart;
///////////////////// end of list of country///////////////////////////


///////////////////// total object by country///////////////////////////
//ArrayList<Integer> objTotalPerCountry = new ArrayList<Integer>();
///////////////////// end of total object by country ///////////////////////////


//////////////////// country by date data/////////////////////////
////ArrayList<Bar> chinaByDateBarchart;
//ArrayList<Integer> chinaByDate;
////ArrayList<Bar> euByDateBarchart;
//ArrayList<Integer> euByDate;
//ArrayList<Integer> countriesByDate;
////ArrayList<Bar> usaByDateBarchart;
//ArrayList<Integer> usaByDate;
////ArrayList<Bar> russiaByDateBarchart;
//ArrayList<Integer> russiaByDate;
////ArrayList<Bar> otherByDateBarchart;
//ArrayList<Integer>otherByDate;
//////////////////// end of country by date /////////////////////////

//////////////////// country by perigee data/////////////////////////
////ArrayList<Bar> chinaPerigeeBarchart;
//ArrayList<Integer> chinaPerigee;
////ArrayList<Bar> euPerigeeBarchart;
//ArrayList<Integer> euPerigee;
////ArrayList<Bar> usaPerigeeBarchart;
//ArrayList<Integer> usaPerigee;
//ArrayList<Integer> countriesPerigee;
////ArrayList<Bar> russiaPerigeeBarchart;
//ArrayList<Integer> russiaPerigee;
////ArrayList<Bar> otherPerigeeBarchart;
//ArrayList<Integer>otherPerigee;
//////////////////// end of country by date /////////////////////////

/////////////// country by apogee data/////////////////////////
////ArrayList<Bar> chinaApogeeBarchart;
//ArrayList<Integer> chinaApogee;
//ArrayList<Integer> countriesApogee;
////ArrayList<Bar> euApogeeBarchart;
//ArrayList<Integer> euApogee;
////ArrayList<Bar> usaApogeeBarchart;
//ArrayList<Integer> usaApogee;
////ArrayList<Bar> russiaApogeeBarchart;
//ArrayList<Integer> russiaApogee;
////ArrayList<Bar> otherApogeeBarchart;
//ArrayList<Integer>otherApogee;
//////////////////// end of country by date /////////////////////////


/////////////////// country by mass data /////////////////////////
//ArrayList<Integer> euByMass;
//ArrayList<Integer> usaByMass;
//ArrayList<Integer> chinaByMass;
//ArrayList<Integer> russiaByMass;
//ArrayList<Integer> otherByMass;
/////////////////// end of country by mass ///////////////////////


//////////////////// labels /////////////////
//ArrayList<String> dateLabels = new ArrayList<String>();
//ArrayList<String> massLabels = new ArrayList<String>();
//ArrayList<String> perigeeLabels = new ArrayList<String>(Arrays.asList("0-550","550-2500","2500-5000","5000-7500","7500-10000","10000+"));//labels for perigeedata
//ArrayList<String> apogeeLabels = new ArrayList<String>(Arrays.asList("0-550","550-2500","2500-5000","5000-7500","7500-10000","10000+"));//labels for apogeedata
////////////////////////////////////////////

//color colourWhite  = color(255);
//color colourBlack  = color(0);
//color red = color(#ff0000);


//String guideMessageDate = "Date entered must between\n 1957 10 04 to 2022 02 28\nDate must be in the format: yyyy mm dd\n"
//+"Country entered should be in lower case\nAvailable countries: China, USA, Europe, \nRussia(including data from SU), All, and Other\n";
//String guideMessageMass = "Mass entered must between 0-104420Kg\n Interval must be a positive real number\n"
//+"Country entered should be in lower case\nAvailable countries: China, USA, Europe, \nRussia(including data from SU), All, and Other\n";
//String guideMessageApogee = "Apogee entered must between 0-2147483647Km\nInterval must be a positive natural number\n"
//+"Country entered should be in lower case\nAvailable countries: China, USA, Europe, \nRussia(including data from SU), All, and Other\n";
//String guideMessagePerigee ="Perigee entered must between 0-2147483647Km\nInterval must be a positive natural number\n"
//+"Country entered should be in lower case\nAvailable countries: China, USA, Europe, \nRussia(including data from SU), All, and Other\n";
//String guideMessageDiameter = "Diameter entered must between 0.0-41.0 M\nInterval must be a positive real number\n"
//+"Country entered should be in lower case\nAvailable countries: China, USA, Europe, \nRussia(including data from SU), All, and Other\n";
//||||||| .r69
//import java.text.SimpleDateFormat;
//import java.time.*;
//import java.time.format.DateTimeFormatter;
//import java.util.Date;
//import java.util.Calendar;
//import java.lang.reflect.*;
//import java.lang.*;
//import java.util.ArrayList;
//import java.util.Arrays;
//import java.text.ParseException;

/////////////////// Pre-Set BarCharts/LineCharts ////////////////
//BarChart testUSAByDate;
//BarChart testEUByDate;
//BarChart testCountriesByDate;
//BarChart testEUmass;
//BarChart testTotalLaunches;
//BarChart testUSAApogee;
//BarChart testCountriesApogee;
//BarChart testUSAPerigee;
//BarChart testCountriesPerigee;
//LineChart testEUDateLine;
//pieChart p = new pieChart();
//ScatterPlot testEmptyScatter;
////String countryName;
////////////////////////////////////////////////////


//UI controller;
//UI.TextWidget textBoxToBeEdited;

////
//UI.CheckBox dateBox, massBox, apogeeBox, perigeeBox;



//final int SCREENWIDTH = 1600; // used in main
//final int SCREENHEIGHT = 1000; // used in main
//PFont stdFont;

//Table tableData;

//final int DEFAULT_X = 15; // used in generateBarchart
//final int DEFAULT_Y = 500;// used in generateBarchart
//final int DISPLAYHEIGHT = 450;  
//final int DISPLAYWIDTH = SCREENWIDTH-1;
//final String[] countryNameArray = {"China", "EU", "USA", "Russia/SU","Other", "All"}; // make this adaptable (IE Soviet Union / not every country )
//final int DEFAULT_Y_COORDINATE_OF_CHART_TITLE = 90;
//ArrayList<String> countryNameList = new ArrayList<String>(Arrays.asList(countryNameArray));
//ArrayList<String> details = new ArrayList<String>();
//ArrayList<AbstractCountry> countries = new ArrayList<>();
//ArrayList<AbstractCountry> Value = new ArrayList<AbstractCountry>();
//ArrayList<AbstractCountry> informat = new ArrayList<AbstractCountry>();
//color text,bottom ,back, select;
//int a, b, c, d, e, f,limit;
//float totalWidthOfBars = 0;
//search s = new search();
//TextWidget newSearch;
//String result = "";
//int screenNumber;
//float textScroll;
//double [] count; // for automatic adaption of margin width
//TextBox info;
//int event1;




/////////////// Event constants ////////
//final int EVENT_TEXT = 1;
//final int EVENT_DATE = 2;
//final int EVENT_MASS = 3;
//final int EVENT_APOGEE = 4;
//final int EVENT_PERIGEE = 5;
//final int EVENT_ENTER = 6;
//final int EVENT_CLEAR = 7;
//final int EVENT_BAR = 8;
//final int EVENT_LINE = 9;
//final int EVENT_DIAMETER = 10;
////////////////////////////////////////
//final int DISTANCE_BETWEEN_BARS = 6;


////////////////////// variables for tab functionality /////////////////////////////
//ArrayList<Screen> screenList = new ArrayList<>();
//final int SCREEN_NULL=-1; //for null screens
//final int SCREEN_DELETE=-2; //to delete screen
//final int EVENT_NULL=0; //for null widgets
//Screen currentScreen;
//TabNavigator tabNav = new TabNavigator();
//boolean mouseHold = false;
//////////////////////////////////////////////////////////////////////


////////////////////// list of countries /////////////////////////////////
//ArrayList<AbstractCountry> earthList = new ArrayList<>();
//ArrayList<AbstractCountry> chinaList = new ArrayList<>();
//ArrayList<AbstractCountry> russiaList = new ArrayList<>();
//ArrayList<AbstractCountry> euList = new ArrayList<>();
//ArrayList<AbstractCountry> usaList = new ArrayList<>();
//ArrayList<AbstractCountry> otherList = new ArrayList<>();
//ArrayList<AbstractCountry> List = new ArrayList<>();
//ArrayList<Bar> totalPerCountryChart;
///////////////////// end of list of country///////////////////////////


///////////////////// total object by country///////////////////////////
//ArrayList<Integer> objTotalPerCountry = new ArrayList<Integer>();
///////////////////// end of total object by country ///////////////////////////


//////////////////// country by date data/////////////////////////
////ArrayList<Bar> chinaByDateBarchart;
//ArrayList<Integer> chinaByDate;
////ArrayList<Bar> euByDateBarchart;
//ArrayList<Integer> euByDate;
//ArrayList<Integer> countriesByDate;
////ArrayList<Bar> usaByDateBarchart;
//ArrayList<Integer> usaByDate;
////ArrayList<Bar> russiaByDateBarchart;
//ArrayList<Integer> russiaByDate;
////ArrayList<Bar> otherByDateBarchart;
//ArrayList<Integer>otherByDate;
//////////////////// end of country by date /////////////////////////

//////////////////// country by perigee data/////////////////////////
////ArrayList<Bar> chinaPerigeeBarchart;
//ArrayList<Integer> chinaPerigee;
////ArrayList<Bar> euPerigeeBarchart;
//ArrayList<Integer> euPerigee;
////ArrayList<Bar> usaPerigeeBarchart;
//ArrayList<Integer> usaPerigee;
//ArrayList<Integer> countriesPerigee;
////ArrayList<Bar> russiaPerigeeBarchart;
//ArrayList<Integer> russiaPerigee;
////ArrayList<Bar> otherPerigeeBarchart;
//ArrayList<Integer>otherPerigee;
//////////////////// end of country by date /////////////////////////

/////////////// country by apogee data/////////////////////////
////ArrayList<Bar> chinaApogeeBarchart;
//ArrayList<Integer> chinaApogee;
//ArrayList<Integer> countriesApogee;
////ArrayList<Bar> euApogeeBarchart;
//ArrayList<Integer> euApogee;
////ArrayList<Bar> usaApogeeBarchart;
//ArrayList<Integer> usaApogee;
////ArrayList<Bar> russiaApogeeBarchart;
//ArrayList<Integer> russiaApogee;
////ArrayList<Bar> otherApogeeBarchart;
//ArrayList<Integer>otherApogee;
//////////////////// end of country by date /////////////////////////


/////////////////// country by mass data /////////////////////////
//ArrayList<Integer> euByMass;
//ArrayList<Integer> usaByMass;
//ArrayList<Integer> chinaByMass;
//ArrayList<Integer> russiaByMass;
//ArrayList<Integer> otherByMass;
/////////////////// end of country by mass ///////////////////////


//////////////////// labels /////////////////
//ArrayList<String> dateLabels = new ArrayList<String>();
//ArrayList<String> massLabels = new ArrayList<String>();
//ArrayList<String> perigeeLabels = new ArrayList<String>(Arrays.asList("0-550","550-2500","2500-5000","5000-7500","7500-10000","10000+"));//labels for perigeedata
//ArrayList<String> apogeeLabels = new ArrayList<String>(Arrays.asList("0-550","550-2500","2500-5000","5000-7500","7500-10000","10000+"));//labels for apogeedata
////////////////////////////////////////////

//color colourWhite  = color(255);
//color colourBlack  = color(0);
//color red = color(#ff0000);


//String guideMessageDate = "Date entered must between\n 1957 10 04 to 2022 02 28\nDate must be in the format: yyyy mm dd\n"
//+"Country entered should be in lower case\nAvailable countries: China, USA, Europe, \nRussia(including data from SU), All, and Other\n";
//String guideMessageMass = "Mass entered must between 0-104420Kg\n Interval must be a positive real number\n"
//+"Country entered should be in lower case\nAvailable countries: China, USA, Europe, \nRussia(including data from SU), All, and Other\n";
//String guideMessageApogee = "Apogee entered must between 0-2147483647Km\nInterval must be a positive natural number\n"
//+"Country entered should be in lower case\nAvailable countries: China, USA, Europe, \nRussia(including data from SU), All, and Other\n";
//String guideMessagePerigee ="Perigee entered must between 0-2147483647Km\nInterval must be a positive natural number\n"
//+"Country entered should be in lower case\nAvailable countries: China, USA, Europe, \nRussia(including data from SU), All, and Other\n";
//String guideMessageDiameter = "Diameter entered must between 0.0-41.0 M\nInterval must be a positive real number\n"
//+"Country entered should be in lower case\nAvailable countries: China, USA, Europe, \nRussia(including data from SU), All, and Other\n";
//=======

import java.text.SimpleDateFormat;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Calendar;
import java.lang.reflect.*;
import java.lang.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.text.ParseException;

///////////////// Pre-Set BarCharts/LineCharts ////////////////
BarChart testUSAByDate;
BarChart testEUByDate;
BarChart testCountriesByDate;
BarChart testEUmass;
BarChart testTotalLaunches;
BarChart testUSAApogee;
BarChart testCountriesApogee;
BarChart testUSAPerigee;
BarChart testCountriesPerigee;
LineChart testEUDateLine;
pieChart p = new pieChart();
ScatterPlot testEmptyScatter;
//String countryName;
//////////////////////////////////////////////////


UI controller;
UI.TextWidget textBoxToBeEdited;

//
UI.CheckBox dateBox, massBox, apogeeBox, perigeeBox;



final int SCREENWIDTH = 1600; // used in main
final int SCREENHEIGHT = 1000; // used in main
PFont stdFont;

Table tableData;

final int DEFAULT_X = 15; // used in generateBarchart
final int DEFAULT_Y = 500;// used in generateBarchart
final int DISPLAYHEIGHT = 450;  
final int DISPLAYWIDTH = SCREENWIDTH-1;
final String[] countryNameArray = {"China", "EU", "USA", "Russia/SU","Other", "All"}; // make this adaptable (IE Soviet Union / not every country )
final int DEFAULT_Y_COORDINATE_OF_CHART_TITLE = 90;
ArrayList<String> countryNameList = new ArrayList<String>(Arrays.asList(countryNameArray));


color text,bottom ,back, select;
int a, b, c, d, e, f,limit;
float totalWidthOfBars = 0;
search s = new search();
TextWidget newSearch;
String result = "";
int screenNumber;
float textScroll;
double [] count; // for automatic adaption of margin width
TextBox info;
int event1;




///////////// Event constants ////////
final int EVENT_TEXT = 1;
final int EVENT_DATE = 2;
final int EVENT_MASS = 3;
final int EVENT_APOGEE = 4;
final int EVENT_PERIGEE = 5;
final int EVENT_ENTER = 6;
final int EVENT_CLEAR = 7;
final int EVENT_BAR = 8;
final int EVENT_LINE = 9;
final int EVENT_DIAMETER = 10;
//////////////////////////////////////
final int DISTANCE_BETWEEN_BARS = 6;


//////////////////// variables for tab functionality /////////////////////////////
ArrayList<Screen> screenList = new ArrayList<>();
final int SCREEN_NULL=-1; //for null screens
final int SCREEN_DELETE=-2; //to delete screen
final int EVENT_NULL=0; //for null widgets
Screen currentScreen;
TabNavigator tabNav = new TabNavigator();
boolean mouseHold = false;
float mousePressX = 0;
float mousePressY = 0;

float mousePre2X = 0;
float mousePre2Y = 0;
////////////////////////////////////////////////////////////////////


//////////////////// list of countries /////////////////////////////////
ArrayList<AbstractCountry> earthList = new ArrayList<>();
ArrayList<AbstractCountry> chinaList = new ArrayList<>();
ArrayList<AbstractCountry> russiaList = new ArrayList<>();
ArrayList<AbstractCountry> euList = new ArrayList<>();
ArrayList<AbstractCountry> usaList = new ArrayList<>();
ArrayList<AbstractCountry> otherList = new ArrayList<>();
ArrayList<AbstractCountry> List = new ArrayList<>();
ArrayList<Bar> totalPerCountryChart;
/////////////////// end of list of country///////////////////////////


/////////////////// total object by country///////////////////////////
ArrayList<Integer> objTotalPerCountry = new ArrayList<Integer>();
/////////////////// end of total object by country ///////////////////////////


////////////////// country by date data/////////////////////////
//ArrayList<Bar> chinaByDateBarchart;
ArrayList<Integer> chinaByDate;
//ArrayList<Bar> euByDateBarchart;
ArrayList<Integer> euByDate;
ArrayList<Integer> countriesByDate;
//ArrayList<Bar> usaByDateBarchart;
ArrayList<Integer> usaByDate;
//ArrayList<Bar> russiaByDateBarchart;
ArrayList<Integer> russiaByDate;
//ArrayList<Bar> otherByDateBarchart;
ArrayList<Integer>otherByDate;
////////////////// end of country by date /////////////////////////

////////////////// country by perigee data/////////////////////////
//ArrayList<Bar> chinaPerigeeBarchart;
ArrayList<Integer> chinaPerigee;
//ArrayList<Bar> euPerigeeBarchart;
ArrayList<Integer> euPerigee;
//ArrayList<Bar> usaPerigeeBarchart;
ArrayList<Integer> usaPerigee;
ArrayList<Integer> countriesPerigee;
//ArrayList<Bar> russiaPerigeeBarchart;
ArrayList<Integer> russiaPerigee;
//ArrayList<Bar> otherPerigeeBarchart;
ArrayList<Integer>otherPerigee;
////////////////// end of country by date /////////////////////////

///////////// country by apogee data/////////////////////////
//ArrayList<Bar> chinaApogeeBarchart;
ArrayList<Integer> chinaApogee;
ArrayList<Integer> countriesApogee;
//ArrayList<Bar> euApogeeBarchart;
ArrayList<Integer> euApogee;
//ArrayList<Bar> usaApogeeBarchart;
ArrayList<Integer> usaApogee;
//ArrayList<Bar> russiaApogeeBarchart;
ArrayList<Integer> russiaApogee;
//ArrayList<Bar> otherApogeeBarchart;
ArrayList<Integer>otherApogee;
////////////////// end of country by date /////////////////////////


///////////////// country by mass data /////////////////////////
ArrayList<Integer> euByMass;
ArrayList<Integer> usaByMass;
ArrayList<Integer> chinaByMass;
ArrayList<Integer> russiaByMass;
ArrayList<Integer> otherByMass;
///////////////// end of country by mass ///////////////////////


////////////////// labels /////////////////
ArrayList<String> dateLabels = new ArrayList<String>();
ArrayList<String> massLabels = new ArrayList<String>();
ArrayList<String> perigeeLabels = new ArrayList<String>(Arrays.asList("0-550","550-2500","2500-5000","5000-7500","7500-10000","10000+"));//labels for perigeedata
ArrayList<String> apogeeLabels = new ArrayList<String>(Arrays.asList("0-550","550-2500","2500-5000","5000-7500","7500-10000","10000+"));//labels for apogeedata
//////////////////////////////////////////

color colourWhite  = color(255);
color colourBlack  = color(0);
color red = color(#ff0000);


String guideMessageDate = "Date entered must between\n 1957 10 04 to 2022 02 28\nDate must be in the format: yyyy mm dd\n"
+"Country entered should be in lower case\nAvailable countries: China, USA, Europe, \nRussia(including data from SU), All, and Other\n";
String guideMessageMass = "Mass entered must between 0-104420Kg\n Interval must be a positive real number\n"
+"Country entered should be in lower case\nAvailable countries: China, USA, Europe, \nRussia(including data from SU), All, and Other\n";
String guideMessageApogee = "Apogee entered must between 0-2147483647Km\nInterval must be a positive natural number\n"
+"Country entered should be in lower case\nAvailable countries: China, USA, Europe, \nRussia(including data from SU), All, and Other\n";
String guideMessagePerigee ="Perigee entered must between 0-2147483647Km\nInterval must be a positive natural number\n"
+"Country entered should be in lower case\nAvailable countries: China, USA, Europe, \nRussia(including data from SU), All, and Other\n";
String guideMessageDiameter = "Diameter entered must between 0.0-41.0 M\nInterval must be a positive real number\n"
+"Country entered should be in lower case\nAvailable countries: China, USA, Europe, \nRussia(including data from SU), All, and Other\n";
//>>>>>>> .r70
