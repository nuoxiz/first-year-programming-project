class pieChart implements Chart{
  float x, y;
  double [] array;
  String title;
  pieChart(){
  }
  pieChart(String title,float x, float y, double [] array){
    this.array = array;
    this.x = x;
    this.y = y;
    this.title = title;
  }
  
  void draw(){
  PChart(x,y,array);
  text("PieChart of Number of Satellites launched per EU, USA, SU, China, and other",100,100);
  
  }
  double[] PieChart(){
    count = new double[5];
    
  Table table = loadTable("gcat.tsv" , "header"); //loads in the data from the table
  for(TableRow row : table.rows())
  {
    String country = row.getString("State");
    if(country.equals("CN")){
      count[0]+=1;
    }
    else if(country.equals("SU") ||country.equals("RU") ){
      count[1]+=1;
    }
    else if(country.equals("EU") || country.equals("UK") || country.equals("I") || country.equals("F") || country.equals("I-ESRO") ||
    country.equals("D") || country.equals("I-NATO") || country.equals("NL") || country.equals("E") || country.equals("I-ESA") ||
    country.equals("I-EUT") || country.equals("S") || country.equals("I-EUM") || country.equals("I-INM") || country.equals("CZ") ||
    country.equals("UA") || country.equals("TR") || country.equals("DK") || country.equals("GR") || country.equals("HU") || 
    country.equals("PL") || country.equals("RO") || country.equals("BY") || country.equals("AT") || country.equals("EE") ||
    country.equals("I-EU") || country.equals("MC") || country.equals("IE") || country.equals("LT") || country.equals("LV") ||
    country.equals("BG") || country.equals("SK") || country.equals("SI"))
    
    {
      
       count[2]+=1;
    }
    else if(country.equals("US")){
      count[3]+=1;
    }
     else {
       count[4]+=1;
     }
     
  }
  return count;
}

  void PChart(float x, float y, double[] data){
    double angle = 0;
    double dataAngle;
    String states = "";
    for (int i=0; i<data.length; i++) {
      switch(i){
      case 0:
      states="CN";
      fill(127,0,0);
      break;
      case 1:
      states="Soviet Union";
      fill(0);
      break;
      case 2:
      states = "EU";
      fill(52,235,219);
      break;
      case 3:
      states="USA";
      fill(52,61,235);
      break;
      case 4:
      states= "OTHER";
      fill(255);
      break;
    }
    
      dataAngle = ((data[i]/51849)*360) * (Math.PI/180);
      arc(x,y,400,400,(float)angle, (float)angle+(float)dataAngle, PIE);
      angle = angle + dataAngle;
      int DAngle = (int) (dataAngle * 100) ;
      text(states + " " + DAngle + "˚" , x+300, y-90 + (i*50));
    }
  }
  

}
