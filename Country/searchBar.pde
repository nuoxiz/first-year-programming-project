 class search{
    search(){
      
    }
   void searchBar(){
   info = new TextBox( "Enter name of satellite: \nIf user does not know the name press enter and leave the space blank: ", 30, 200, 400, 80,  215,0300 << 030, color(255, 255), color(0, 0), color(0, 0));
  }
     public ArrayList<AbstractCountry>Name(String name){
        ArrayList<AbstractCountry> Value = new ArrayList<>();
       for(AbstractCountry i : List){
        if(name != ""){
          if (name.replace(" ", "").equalsIgnoreCase(i.name.replace(" ", ""))){ 
          //if (name.replace(" ", "").toLowerCase().indexOf(i.name.replace(" ", "").toLowerCase()) >= 0){ 
            //println("hi");
             Value.add(i);

          }
          //else Value = List;
        }
        
        else return null;
       }
        return Value;
     }
     public ArrayList<AbstractCountry> Country(String Country,String name){
        ArrayList<AbstractCountry> Value = new ArrayList<>();
      if(name== ""){
      if(Country != ""){
        for(int index = 0; index < countryNameArray.length ; index++){
          if(Country.equalsIgnoreCase(countryNameArray[index])){
           result = countryNameArray[index];
           Country = Country.toLowerCase();
           Country = Country + "List";
          }
        }
           if(Country.equals("chinaList")){
           Value = chinaList;
         //println("chosen");
       }
     else if(Country.equals("usaList")){
       Value= usaList;
     }
     else if(Country.equals("euList")){
       Value = euList;
     }
     else if(Country.equals("otherList")){
       Value = otherList;
     }
     else if(Country.equals("russiaList")){
       Value = russiaList;
     }
     else{
       Value = List;
     }

      }
      else{
        Value = List;
      }
        }

       return Value;
     }
    public ArrayList<AbstractCountry> Apogee(ArrayList<AbstractCountry>Name,ArrayList<AbstractCountry>C,int specificApogee, int minApogee, int maxApogee,String Country)
    {

     ArrayList<AbstractCountry> Value = new ArrayList<>();
     if(Name != null){

   for(AbstractCountry i : Name){
     if(specificApogee!= 0){
       if(specificApogee == i.apogee){
          Value.add(i);
       }
     }
     else{
      if(minApogee != 0){

        if(maxApogee != 0){

         if(maxApogee >= i.apogee &&  minApogee <= i.apogee){
                 Value.add(i);

         }
        }
        else{
          if(minApogee != 0){
             if(minApogee <= i.apogee){
              Value.add(i);
           }
          }
        }
      }
      else{
         if(maxApogee != 0){
           if(maxApogee >= i.apogee){
              Value.add(i);
           }
         }
         else{
           //println("YEHWAAA");
            Value.add(i);
         }
      }
   }
   }
  }
  else{
    for(AbstractCountry i : C){
      if(specificApogee!= 0){
       if(specificApogee == i.apogee){
          Value.add(i);
       }
      }
       else{
      if(minApogee != 0){

        if(maxApogee != 0){

         if(maxApogee >= i.apogee &&  minApogee <= i.apogee){
                 Value.add(i);

         }
        }
        else{
          if(minApogee != 0){
             if(minApogee <= i.apogee){
              Value.add(i);
           }
          }
        }
      }
      else{
         if(maxApogee != 0){
           if(maxApogee >= i.apogee){
              Value.add(i);
           }
         }
         else{
            Value.add(i);
         }
      }
    }
      }
  }

      return Value;
  }
   public ArrayList<AbstractCountry> Perigee(ArrayList<AbstractCountry>A,int specificPerigee,int minPerigee, int maxPerigee)
    {
      ArrayList<AbstractCountry> Value = new ArrayList<>();


   for(AbstractCountry i : A){

      if(specificPerigee!= 0){
       if(specificPerigee == i.perigee){
          Value.add(i);
       }
     }
     else{
      if(minPerigee!= 0){

        if(maxPerigee != 0){

         if(maxPerigee >= i.perigee &&  minPerigee <= i.perigee){
                 Value.add(i);

         }
        }
        else{
          if(minPerigee!= 0){
             if(minPerigee <= i.perigee){
              Value.add(i);
           }
          }
        }
      }
      else{
         if(maxPerigee != 0){
           if(maxPerigee >= i.perigee){
              Value.add(i);
           }
         }
         else{
           Value.add(i);
         }
      }
   }
   }


      return Value;
  }
   public ArrayList<AbstractCountry> Mass(ArrayList<AbstractCountry>M,int specificMass,int minMass, int maxMass)
    {
      ArrayList<AbstractCountry> Value = new ArrayList<>();


   for(AbstractCountry i : M){
      if(specificMass!= 0){
       if(specificMass == i.mass){
          Value.add(i);
       }
     }
     else{
      if(minMass!= 0){

        if(maxMass != 0){

         if(maxMass >= i.mass &&  minMass <= i.mass){
               //println(i);
                 Value.add(i);

         }
        }
        else{
          if(minMass!= 0){
             if(minMass <= i.mass){
               //println(i);
              Value.add(i);
           }
          }
        }
      }
      else{
         if(maxMass != 0){
           if(maxMass >= i.mass){
             //println(i);
              Value.add(i);
           }
         }
         else{
           //println(i);
           Value.add(i);
         }
      }
   }
   }

      return Value;
  }
  }

  class TextBox {
     int displayedValues = 0;
ArrayList<String> details = new ArrayList<String>();

ArrayList<AbstractCountry> countries = new ArrayList<>();
ArrayList<AbstractCountry> Value = new ArrayList<AbstractCountry>();
ArrayList<AbstractCountry> informat = new ArrayList<AbstractCountry>();
    
    
  boolean thisEvent;
  String label = "";
  String title;
  int counter=1;


  int y =80;
  int x =500;

  TextBox( String tit, int h, int i, int j, int k,  int l,
    color m, color n, color o, color p) {

    title=tit;
    c =  j;
    a =  h;
    b =  i;
    d =  k;
    limit =  l;
    e = (h + j);
    f =  (i + k);
    select = p;
    bottom = n;
    back = o;
    text = m;
  }

  void display() {

    fill(bottom);
    stroke(0);
    stroke(0);  
    //rect(a - 30, b-110, c+120, d+130);
    
    rect(a-20, b-90, c+35, d+100);
    rect(a-5, b-5, c+5, d+5);
    
    /*
    fill(bottom);
    
    rect(a-30, b - 110, c + 120, d + 130);
  */
    fill(0,0,0);
    stroke(0,0,0);
    text(title, a, b-70);

    
    fill(text);
    text(label, a, b, c, d);
    
    noStroke();

  }

 void SearchBarChar(char s) {
       
  
   
      String [] size = label.split(", ");
      String option = "";
      String option1 = "";
      String option2 = "";
      String name ;
      boolean isNumber = false;
      boolean isNumber1 = false;
      boolean isNumber2 = false;
      String possibleNumber = "";
      String possibleNumber1 = "";
      String possibleNumber2 = "";
      int number = 0;
      int number1 = 0;
      int number3 = 0;
      String country;
      
      
      if(s == TAB){
        event1 = 0;
      }
     if (s == CODED)  return;

    int len = label.length();

    if(s == BACKSPACE)
    {
      if(!label.equals(""))
        label=label.substring(0,label.length()-1);
    }
     else if (len >= limit) {
      return;
    }

    else if(s == ENTER || s == RETURN){
      if(counter <= 20){
      if(label.equals("")){
           name = null;
         }
          else {
           name = label;
         }

        counter+=1;
        if(counter==2){
        title = "enter Country code : China, EU, USA, Russia/SU,Other \n if user does not know the name press enter and leave space blank ";
        label = label + ", ";

        }
        if (counter==3) {
          title = "Does the user know the apogee of a specific satellite, enter \nyes or no";
          label = label + ", ";

        }
        if (counter==4) {
          title = "If yes, enter to apogee but if no enter the min, max or both of apogee and \n the details of those satellites that are in range will be shown \n if you are not interested in a satellite's apogee enter 0 ";
          label = label + ", ";
        }
        if(counter==5){
          title = "enter min of apogee you want to details on or enter 0 if you \nare not interested";
           label = label + ", ";

        }
          if(counter==6){
          title = "enter max of apogee you want to details on or enter 0 if you \nare not interested";
          label = label + ", ";

        }
        if (counter==7) {
          title = "does the user know the perigee of a specific satellite, enter yes or no";
           label = label + ", ";

        }
        if (counter==8) {

          title = "if yes, enter to perigee but if no enter the min, max or both of perigee and \n the details of those satellites that are in range will be shown \n if you are not interested in perigee enter 0 ";
          label = label + ", ";

        }
          if(counter==9){
          title = "enter min of perigee you want to details on or enter 0 if you \nare not interested";
          label = label + ", ";

        }
          if(counter==10){
          title = "enter max of perigee you want to details on or enter 0 if you \nare not interested";
           label = label + ", ";

        }
        if (counter==11) {
          title = "does the user know the mass of a specific satellite, enter yes \nor no";
           label = label + ", ";

        }
        if (counter==12) {
          title = "if yes, enter to mass but if no enter the min, max or both of mass and \n the details of those satellites that are in range will be shown \n if you are not interested in \n enter 0 ";
           label = label + ", ";
        }
          if(counter==13){
          title = "enter min of mass you want to details on or enter 0 if you \nare not interested";
           label = label + ", ";

        }
          if(counter==14){
          title = "enter max of mass you want to details on or enter 0 if you \nare not interested";
          label = label + ", ";

        }
      }
    }
    else {
          label += str(s) ;

        }
 if(counter==15){
   details = new ArrayList<String>();
   size = label.split(", ");
   if (size.length >=13){
     //println(label);
     if(!Pattern.matches("[0-9]+", possibleNumber2)){
       search se = new search();
       se.Name(size[0]);
       if(!Pattern.matches("[0-9]+", possibleNumber2)){
         se.Country(size[1],size[0]);
         option = size[4];
         option1 = size[5];
         option2 = size[3];
         possibleNumber = option;
         possibleNumber1 = option1;
         possibleNumber2 = option2;
         isNumber = Pattern.matches("[0-9]+", possibleNumber);
         isNumber1 = Pattern.matches("[0-9]+", possibleNumber1);
         isNumber2 = Pattern.matches("[0-9]+", possibleNumber2);
  
         if(isNumber2){
           if(isNumber) {
             if(isNumber1){
               number3 = Integer.parseInt(possibleNumber2);
               number = Integer.parseInt(possibleNumber);
               number1 = Integer.parseInt(possibleNumber1);
  
               se.Apogee(se.Name(size[0]),se.Country(size[1],size[0]),number3,number,number1 ,size[1]);
  
               option = size[8];
               option1 = size[9];
               option2 = size[7];
  
               possibleNumber = option;
               possibleNumber1 = option1;
               possibleNumber2 = option2;
  
               isNumber = Pattern.matches("[0-9]+", possibleNumber);
               isNumber1 = Pattern.matches("[0-9]+", possibleNumber1);
               isNumber2 = Pattern.matches("[0-9]+", possibleNumber2);
  
               if(isNumber2){
                 if(isNumber) {
                   if(isNumber1){
                     number = Integer.parseInt(possibleNumber);
                     number1 = Integer.parseInt(possibleNumber1);
                     number3 = Integer.parseInt(possibleNumber2);
                     se.Perigee(se.Apogee(se.Name(size[0]),se.Country(size[1],size[0]),Integer.parseInt(size[3]),Integer.parseInt(size[4]), Integer.parseInt(size[5]),size[1]),number3,number,number1);
                     option = size[12];
                     option1 = size[13];
                     option2 = size[11];
  
                     possibleNumber = option;
                     possibleNumber1 = option1;
                     possibleNumber2 = option2;
  
                     isNumber = Pattern.matches("[0-9]+", possibleNumber);
                     isNumber1 = Pattern.matches("[0-9]+", possibleNumber1);
                     isNumber2 = Pattern.matches("[0-9]+", possibleNumber2);
  
                     if(isNumber2){
                       if(isNumber) {
                         if(isNumber1){
                           number = Integer.parseInt(possibleNumber);
                           number1 = Integer.parseInt(possibleNumber1);
                           //?
                           informat = se.Mass( se.Perigee( se.Apogee( se.Name( size[0] ), se.Country(size[1], size[0]), Integer.parseInt(size[3]),Integer.parseInt(size[4]), Integer.parseInt(size[5]),size[1]),Integer.parseInt(size[7]),Integer.parseInt(size[8]),Integer.parseInt(size[9])),Integer.parseInt(size[11]),Integer.parseInt(size[12]),Integer.parseInt(size[13]));
                           textScroll = 0;
                           for(AbstractCountry i : informat){
                             details.add(i.toString());
                           }
               
                           if(informat.size()==0){
                               
                             details.add("None of the satellites seem to fit your search");
                           }
                         } else {
                           title = "Error in query, please enter new search";
                         }
                       } else {
                         title = "Error in query, please enter new search";
                       }
                     } else {
                       title = "Error in query, please enter new search";
                     }
                   } else {
                     title = "Error in query, please enter new search";
                   }
                 } else {
                   title = "Error in query, please enter new search";
                 }
               } else {
                 title = "Error in query, please enter new search";
               }
             } else {
               title = "Error in query, please enter new search";
             }
           } else {
             title = "Error in query, please enter new search";
           }
         } else {
           title = "Error in query, please enter new search";
         }
       } else {
         title = "Error in query, please enter new search";
       }
     } else {
       title = "Error in query, please enter new search";
     }   
   } else {
      title = "Error in query, please enter new search";
   }
   
   counter = 0;
 }
  }

  void draw(){
     y =80;
     x =500;
     fill(255);
     rect(x-10, y - 10, SCREENWIDTH- x, DEFAULT_Y-(y-10));
     
     fill(0);
     //translate(0, 80);
     
     int size = details.size();
     if (details.size()== 0){
       size = 1;
     }
     //ellipse(width-50, y +420 *((textScroll/20.0 ) / size*20), 10, 10);
     text((int)textScroll, width - 50 , y + 10);
     //println(  y +  (420  * ((textScroll/20.0 ) / (size))));
     displayedValues = 0;
     int index = 0;
     for(String i : details){
       index++;
       if (y - textScroll >= 80  && y - textScroll <= 490 ){
         
         displayedValues ++;
         text(index + ". " + i, x, 5 +y - textScroll); 
       } 
       y+=20;
     }
     
     y =80;
     x =500;
  }
}
     //if(textScroll < -200){
     /*
     if(details.size()!= 0){
       details.remove(0);
       
     }
     */
     //textScroll+=20;
     //}
//>>>>>>> .r70
    
//  }

//  boolean event() {
//    return thisEvent = mouseX>a && mouseX < a+width && mouseY >b && mouseY <b+height;
//  }

//  }
