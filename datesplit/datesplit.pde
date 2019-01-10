String a = "a,a,01/03/2004";

String b = "a,a,01/03/2004,21/03/2004";





void settings()  {
  
}


void setup () {
  
  
} 


void draw () {

String [] c = split(a,",");

String [] d = split(c[2],"/"); 

println(c[0]);
println(c[1]);
println(d[0]);
println(d[1]);
println(d[2]);
}