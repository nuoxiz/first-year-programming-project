// Class implemented by Liam Zone

abstract class Datapoint{
     Calendar launchDate;
     /*
     Please do NOT remove the public keyword from the following fields, they are vital for the functioning of 
     the selectData(),mergeSort() and merge() methods which was implemented using Java Reflection.
     */
     public String name;
     public String status;
     public int apogee;
     public int perigee;
     public double diameter;
     public double mass;
     public String country;
     
  // Country Constructor
  Datapoint(String name, String status, int apogee, int perigee, double diameter,
         double mass, Calendar launchDate){
       this.name = name;
       this.launchDate = launchDate;
       this.status = status;
       this.apogee = apogee;
       this.perigee = perigee;
       this.diameter = diameter;
       this.mass = mass;
  }
  
  
  // Space Objects Constructor
    Datapoint(String name, String status, int apogee, int perigee, double diameter,
         double mass, Calendar launchDate, String countryCode){
       this.name = name;
       this.launchDate = launchDate;
       this.status = status;
       this.apogee = apogee;
       this.perigee = perigee;
       this.diameter = diameter;
       this.mass = mass;
       this.country = countryCode;
  }
  
  void setCurrentEventString(String s) {}
}
