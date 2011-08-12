void buildModel() {

  byte cubeSize = 2;
  byte step = 4;
  int imgWidth = cubeSize * designWidth;
  int imgHeight = cubeSize * designHeight;
  float inc = 2; /* 360 / totalSegments*/ //how many degrees each one rotates by
  int radius = 170; //radius of the whole ring
  int segments = 12; //number of segments of the square pattern
  
  float slashX = cubeSize*0.3;
  float slashY = cubeSize*1.5;
  float slashZ = cubeSize;
  
  
  UGeometry[][] cubes = new UGeometry[designWidth][designHeight];
  UGeometry[][] slashesLeft = new UGeometry[designWidth][designHeight];
  UGeometry[][] slashesRight = new UGeometry[designWidth][designHeight];
  
  model=new UGeometry();
  
  for (int m = 0; m < segments; m++) {
    for (int cols = 0; cols < designHeight; cols++) {
      for(int rows = 0; rows < designWidth; rows++) {
  
        if (!Pixels[cols][rows]) { //make a solid box
          cubes[cols][rows] = Primitive.box(cubeSize, cubeSize, cubeSize);
          cubes[cols][rows].rotateY(radians(-cols * inc + (m*30)));
          cubes[cols][rows].translate(cos(radians(-cols*inc+ (m*30))) * radius, rows*step - imgHeight + (step/2), sin(radians(-cols*inc+ (m*30))) * radius);
          model.add(cubes[cols][rows]);
        } else { //make an x
        
          slashesLeft[cols][rows] = Primitive.box(slashX, slashY, slashZ);
          slashesLeft[cols][rows].rotateZ(PI/4);
          slashesLeft[cols][rows].rotateY(PI/2);
          slashesLeft[cols][rows].rotateY(radians(-cols * inc+ (m*30)));
          slashesLeft[cols][rows].translate(cos(radians(-cols*inc+ (m*30))) * radius, rows*step - imgHeight + (step/2), sin(radians(-cols*inc+ (m*30))) * radius);
     
          model.add(slashesLeft[cols][rows]);
  
          slashesRight[cols][rows] = Primitive.box(slashX, slashY, slashZ);
          slashesRight[cols][rows].rotateZ(PI/4);
          slashesRight[cols][rows].rotateY(PI/2);
          slashesRight[cols][rows].rotateY(radians(-cols * inc+ (m*30)));
          slashesRight[cols][rows].translate(cos(radians(-cols*inc+ (m*30))) * radius, rows*step - imgHeight + (step/2), sin(radians(-cols*inc+ (m*30))) * radius);
          
          model.add(slashesRight[cols][rows]);
        }
     }
    }
  }

}

