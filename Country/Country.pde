
/*
  It is possible that implementing individual classes might be more effort than its worth.
  Additionally, AbractCountry Class *should* be a container for indivual objects, not holding specific data itself.
  This should probably take the form of a ArrayList of some form.
  Currently this class is closer in function to a individual datapoint.
  - Liam Zone 17/03/2022
*/

/*
  We had decided that we are going to divide the data by countries. To ensure that all the countries classes have the 
  same fields, we had decided to implements an abstract Country class. Implementing an abstract class allow us to
  take advantage of polymorphism of Java.
  The abstract class contains 7 fields, a constructor and a default method toString().
  This class is implemented by Nuoxi Zhang on 16/03/2022
*/



abstract class AbstractCountry extends Datapoint{
     
     
     
   public AbstractCountry(String name, String status, int apogee, int perigee, double diameter,
         double mass, Calendar launchDate)
     {
       super(name, status, apogee, perigee, diameter, mass, launchDate); 
      
     }
     // Return a string outline a brief summary of each object.
     public String toString()
     {
       String ret = "";
       ret += "Name: " + this.name + "  ";
       ret += "Status: " + this.status + "  ";
       try
       {
         ret += "Launch Date: " + this.launchDate.getTime()+ "  ";
       }catch(NullPointerException ex)
       {
         ret += "Launch Date: " + "Not Available" + "  ";
       }
       ret += "Diamter(m): " + this.diameter + "  ";
       ret += "Apogee(km): " + this.apogee+ "  ";
       ret += "Perigee(km): " + this.perigee + "  ";
       ret += "Mass(kg): " + this.mass;
       return ret;
       
     }
}
// This class is implemented by Nuoxi Zhang on 16/03/2022
class Earth extends AbstractCountry
{
  public Earth(String name, String status, int apogee, int perigee, double diameter, double mass,
      Calendar launchDate) {
    super(name, status, apogee, perigee, diameter, mass, launchDate); // calls the constuctor of the superclass
    
  }
  
}

// This class is implemented by Nuoxi Zhang on 16/03/2022
class Russia extends AbstractCountry
{
  public Russia(String name, String status, int apogee, int perigee, double diameter, double mass,
      Calendar launchDate) {
    super(name, status, apogee, perigee, diameter, mass, launchDate); // calls the constuctor of the superclass
    
  }
  
}
// This class is implemented by Nuoxi Zhang on 16/03/2022
class China extends AbstractCountry
{
  public China(String name, String status, int apogee, int perigee, double diameter, double mass,
      Calendar launchDate) {
    super(name, status, apogee, perigee, diameter, mass, launchDate);// calls the constuctor of the superclass
    
  }
  
}

// This class is implemented by Liam Zone on 17/03/2022
class USA extends AbstractCountry
{
  public USA(String name, String status, int apogee, int perigee, double diameter, double mass,
      Calendar launchDate) {
    super(name, status, apogee, perigee, diameter, mass, launchDate);// calls the constuctor of the superclass
    
  }
  
}

//Classes EU and Other are implemented by Mykhailo Bitiutskyy on 23/03/2022
class EU extends AbstractCountry
{
  public EU (String name, String status, int apogee, int perigee, double diameter, double mass,
      Calendar launchDate) {
    super(name, status, apogee, perigee, diameter, mass, launchDate); // calls the constuctor of the superclass
        
  }
  
}
class Other extends AbstractCountry
{
  public Other (String name, String status, int apogee, int perigee, double diameter, double mass,
      Calendar launchDate) {
        super(name, status, apogee, perigee, diameter, mass, launchDate); // calls the constuctor of the superclass
        
  }
  
}
class OtherName extends AbstractCountry
{
  public OtherName (String name, String status, int apogee, int perigee, double diameter, double mass,
      Calendar launchDate) {
        super(name, status, apogee, perigee, diameter, mass, launchDate); // calls the constuctor of the superclass
        
  }
}
