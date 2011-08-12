void buildModel() {

  byte cubeSize = 5;
  byte step = 10;
  int imgWidth = cubeSize * designWidth;
  int imgHeight = cubeSize * designHeight;

  
  UGeometry[][] cubes = new UGeometry[designWidth][designHeight];
  UGeometry[][] slashesLeft = new UGeometry[designWidth][designHeight];
  UGeometry[][] slashesRight = new UGeometry[designWidth][designHeight];
  
  model=new UGeometry();
  
  for (int cols = 0; cols < designHeight; cols++) {
    for(int rows = 0; rows < designWidth; rows++) {

      if (!Pixels[cols][rows]) { //make a solid box
        cubes[cols][rows] = Primitive.box(cubeSize, cubeSize, cubeSize);
         ////////
       // cubes[cols][rows].rotateY(radians(cols));
        //////////
        cubes[cols][rows].translate(cols*step - imgWidth + (step/2), rows*step - imgHeight + (step/2), 0);
        model.add(cubes[cols][rows]);
      } else { //make an x
        slashesLeft[cols][rows] = Primitive.box(cubeSize+2.5, 1, cubeSize);
        slashesLeft[cols][rows].rotateZ(PI/4);
        slashesLeft[cols][rows].translate(cols*step - imgWidth + (step/2), rows*step - imgHeight + (step/2), 0);
        
        ////////
        //slashesLeft[cols][rows].rotateX(radians(-rows));
        ////////
        
        model.add(slashesLeft[cols][rows]);
        //overwrite
        slashesRight[cols][rows] = Primitive.box(1, cubeSize+2.5, cubeSize);
        slashesRight[cols][rows].rotateZ(PI/4);
        slashesRight[cols][rows].translate(cols*step - imgWidth + (step/2), rows*step - imgHeight + (step/2), 0);
        
        /////////
        //slashesRight[cols][rows].rotateX(radians(-rows));
        /////////
        
        model.add(slashesRight[cols][rows]);
      }
   }
  }
}

