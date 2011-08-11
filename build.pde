void buildModel() {

  byte cubeSize = 5;
  byte step = 10;
  int imgWidth = cubeSize * designWidth;
  int imgHeight = cubeSize * designHeight;
  
  
  UGeometry[][] cubes = new UGeometry[designWidth][designHeight];
  
  model=new UGeometry();
  
  for (int cols = 0; cols < designHeight; cols++) {
    for(int rows = 0; rows < designWidth; rows++) {

      if (!Pixels[cols][rows]) { //make a solid box
        cubes[cols][rows] = Primitive.box(cubeSize, cubeSize, cubeSize);
        cubes[cols][rows].translate(cols*step - imgWidth + (step/2), rows*step - imgHeight + (step/2), 0);
        model.add(cubes[cols][rows]);
      } else { //make an x
        cubes[cols][rows] = Primitive.box(cubeSize+2, 1, cubeSize);
        cubes[cols][rows].rotateZ(PI/4);
        cubes[cols][rows].translate(cols*step - imgWidth + (step/2), rows*step - imgHeight + (step/2), 0);
        model.add(cubes[cols][rows]);
        //overwrite
        cubes[cols][rows] = Primitive.box(1, cubeSize+2, cubeSize);
        cubes[cols][rows].rotateZ(PI/4);
        cubes[cols][rows].translate(cols*step - imgWidth + (step/2), rows*step - imgHeight + (step/2), 0);
        model.add(cubes[cols][rows]);
      }
   }
  }
}

