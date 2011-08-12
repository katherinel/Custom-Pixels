void buildModel() {

  float cubeSize = 2.9;
  float step = cubeSize *2;
  float imgWidth = cubeSize * designWidth;
  float imgHeight = cubeSize * designHeight;
  float inc = cubeSize * 0.65; /* 360 / totalSegments*/ //how many degrees each one rotates by
  int radius = 170; //radius of the whole ring
  int segments = 12; //number of segments of the square pattern
  float segFactor = 360/segments;
  
  float slashX = cubeSize*0.2;
  float slashY = cubeSize*1.4;
  float slashZ = cubeSize;
  
  
  UGeometry[][] cubes = new UGeometry[designWidth][designHeight];
  UGeometry[][] slashesLeft = new UGeometry[designWidth][designHeight];
  UGeometry[][] slashesRight = new UGeometry[designWidth][designHeight];
  
  model=new UGeometry();
  
  for (int m = 0; m < segments; m++) {
    for (int cols = 0; cols < designHeight; cols++) {
      float radiansFactor = radians(-cols * inc + (m*segFactor));
      float cosineFactor = cos(radiansFactor) * radius;
      float sineFactor = sin(radiansFactor) * radius;
      
      for(int rows = 0; rows < designWidth; rows++) {
        if (!Pixels[cols][rows]) { //make a solid box
          cubes[cols][rows] = Primitive.box(cubeSize, cubeSize, cubeSize);
          cubes[cols][rows].rotateY(radiansFactor);
          cubes[cols][rows].translate(cosineFactor, rows*step - imgHeight + (step/2), sineFactor);
          model.add(cubes[cols][rows]);
        } else { //make an x
        
          slashesLeft[cols][rows] = Primitive.box(slashX, slashY, slashZ);
          slashesLeft[cols][rows].rotateZ(PI/4);
          slashesLeft[cols][rows].rotateY(PI/2);
          slashesLeft[cols][rows].rotateY(radiansFactor);
          slashesLeft[cols][rows].translate(cosineFactor, rows*step - imgHeight + (step/2), sineFactor);
     
          model.add(slashesLeft[cols][rows]);
  
          slashesRight[cols][rows] = Primitive.box(slashX, slashY, slashZ);
          slashesRight[cols][rows].rotateZ(-PI/4);
          slashesRight[cols][rows].rotateY(PI/2);
          slashesRight[cols][rows].rotateY(radiansFactor);
          slashesRight[cols][rows].translate(cosineFactor, rows*step - imgHeight + (step/2), sineFactor);
          
          model.add(slashesRight[cols][rows]);
        }
     }
    }
  }

}

