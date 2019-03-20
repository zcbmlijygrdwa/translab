boolean ifInDict(String w, String[] dictt) {
  for (String s : dictt) {
    if (s.equals(w))
      return true;
  }
  return false;
}


String[][] getCombination(){
  
  String[][] output = new String[tempWords.size()][];
  
  
  return output;
}


void addLetter(Letter l, Letter[] ls){
 
  for(int i = 0; i<ls.length;i++){
    if(ls[i]==null){
      ls[i] = l;
      break;
    }
  }
}


double getDistance(double x, double y, double xIn, double yIn) {
    return Math.sqrt((x-xIn)*(x-xIn)+(y-yIn)*(y-yIn));
  }


void renderAllLeters(Letter[] ls){
  for(int i = 0; i<ls.length;i++){
    if(ls[i]!=null){
      ls[i].drawMe();
    }
    else{
      break;  //stop seeking the next letter in the letterSet
    }
  }
  
}

//void permutation(String prefix, String str) 




String keyAnalyzer(char c)
{
    if (c == '0' || c == '1' || c == '2' || c == '3' || c == '4' || c == '5' || c == '6' || c == '7' || c == '8' || c == '9')
    {
        return "NUMBER";
    }
    else if (c == 'A' || c == 'a' || c == 'B' || c == 'b' || c == 'C' || c == 'c' || c == 'D' || c == 'd' || c == 'E' || c == 'e' ||
             c == 'F' || c == 'f' || c == 'G' || c == 'g' || c == 'H' || c == 'h' || c == 'I' || c == 'i' || c == 'J' || c == 'j' ||
             c == 'K' || c == 'k' || c == 'L' || c == 'l' || c == 'M' || c == 'm' || c == 'N' || c == 'n' || c == 'O' || c == 'o' ||
             c == 'P' || c == 'p' || c == 'Q' || c == 'q' || c == 'R' || c == 'r' || c == 'S' || c == 's' || c == 'T' || c == 't' ||
             c == 'U' || c == 'u' || c == 'V' || c == 'v' || c == 'W' || c == 'w' || c == 'X' || c == 'x' || c == 'Y' || c == 'y' ||
             c == 'Z' || c == 'z')
    {
        return "LETTER";
    }
    else
    {
        return "OTHER";
    }
}



String[] getCombination(String input){
  
  
  permutation(input);
  String[] output = new String[tempWords.size()];
   for(int i = 0;i < tempWords.size();i++){
   //println("stockList = "+i+", "+tempWords.get(i)); 
   output[i] = tempWords.get(i);
  }
  return output;
}

public  void permutation(String str) { 
    permutation("", str); 
}

private  void permutation(String prefix, String str) {
    int n = str.length();
    if (n == 0){
      tempWords.add(prefix);
     // System.out.println(prefix);
    }
    else {
        for (int i = 0; i < n; i++)
            permutation(prefix + str.charAt(i), str.substring(0, i) + str.substring(i+1, n));
    }
}