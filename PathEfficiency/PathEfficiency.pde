String filename = "";
int participant = 13;

String savefile = "data/" + str(participant) + "_PE.txt";
ArrayList<String> saveList = new ArrayList<String>();

void setup(){
  for(int i = 0; i < 168; i++){
    for(int j = 0; j < 6; j++){
      filename = str(participant)+ "/" +str(participant) + "_" + str(i) + "_" + str(j) + ".txt";
      String [] lines = loadStrings(filename);
      float dummyPath = 0;
      float realPath = 0;
      float PE = 0;
      int error = 0;
      String str = "";
      int A = 0;
      int MT = 0;
      int startTime = 0;
      int endTime = 0;
      int practice = 0;
      int lastPositionX = 0;
      int lastPositionY = 0;
      int targetX = 0;
      int targetY = 0;
      for(int k = 0; k < lines.length-1; k++){
        String [] list = split(lines[k], ",");
        String [] nextList = split(lines[k+1], ",");
        if(k == 0){
          startTime = int(list[6]);
        }
        if(A < int(list[1])){
          A = int(list[1]);
          str = "";
          for(int l = 0; l < 6; l++){
            str = str + list[l] + ",";
          }
        }
       
        dummyPath += sqrt(pow(float(nextList[7]) - float(list[7]),2) + pow(float(nextList[8]) - float(list[8]),2));
        realPath += sqrt(pow(float(nextList[9]) - float(list[9]),2) + pow(float(nextList[10]) - float(list[10]),2));
        
        error = int(nextList[11]);
        endTime = int(nextList[6]);
        practice = int(nextList[14]);
        lastPositionX = int(nextList[7]);
        lastPositionY = int(nextList[8]);
        targetY = 11;
        if(A == 350){
          targetX = 1125+11;
        } else {
          targetX = 1300+11;
        }
      }
      MT = endTime - startTime;
      PE = (dummyPath/realPath)*100;
      println(str);
      str = str + str(MT) + "," + str(error) + "," + str(dummyPath)+","+str(realPath)+","+str(PE)+","+str(targetX)+","+str(targetY)+","+str(lastPositionX)+","+str(lastPositionY)+","+str(i)+","+str(j)+","+str(practice);
      saveList.add(str);
      println(str);
    }
  }
  
  String [] saveString = new String [saveList.size()];
  for(int i = 0; i < saveString.length; i++){
    saveString[i] = saveList.get(i);
  }
  saveStrings(savefile, saveString);
}
