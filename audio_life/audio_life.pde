import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

  float C1= 0;
  float C2= 255;
  boolean inv= false;
  float time= 0;
int savedTime;
int totalTime = 1000;
int sideways=0;
int horizontal = 1;
void setup() {

  savedTime = millis();
  
  //size(1920,1080);
  fullScreen();
  minim = new Minim(this);
  ap = minim.loadFile("sketches_audio2_data_Gorgon City - All FIVE Walls ft. Vaults.mp3");
  ap.play();
  ab = ap.mix;

  halfH = height/2;
  colorInc1 = 255/(float)1024;
  colorInc2 = 255/(float)500;
  colorMode(HSB);
  
  
  ////////////////////////////////////////
  board = new boolean[size][size];
  next = new boolean[size][size];
  cellSize = width / (float) size;
 // randomise();
  ////////////////////////////////////////
}
////////////////////////////////////////
boolean isAlive(int row, int col)
{
  if (row >= 0 && row < size && col >= 0 && col < size)
  {
    return board[row][col];
  } else
  {
    return false;
  }
}
///////////////////////////////////////

Minim minim;
AudioPlayer ap;
AudioInput ai;
AudioBuffer ab;

float halfH;

float colorInc1;
float colorInc2;

float[] lerpedBuffer = new float[1024];

float lerpedY=0;

void draw() {
  background(0);
  /////////////////
  //drawBoard();
  drawBoard2();
  update();
  ////////////////
 float sum = 0 ;
 
  for (int i = 0; i<ab.size(); i++) {
   /* stroke(colorInc1 * i, 255, 255);
    strokeWeight(1);
        line(i, 0-lerpedBuffer[i]*halfH, i, 0+lerpedBuffer[i]*halfH);
        line(i, 500-lerpedBuffer[i]*halfH, i, 500+lerpedBuffer[i]*halfH);
        
    stroke(colorInc2 * i, 255, 255);
        line(0-lerpedBuffer[i]*halfH, i, 0+lerpedBuffer[i]*halfH,i);
        line(1024-lerpedBuffer[i]*halfH, i, 1024+lerpedBuffer[i]*halfH,i);
   */
    
    sum +=abs(ab.get(i));
   lerpedBuffer[i] = lerp(lerpedBuffer[i], ab.get(i), 0.1f);
   
   

  }
  float average = sum / (float)ab.size();
  lerpedY = lerp(lerpedY, average, 0.1f);
  strokeWeight(4);
  stroke(255);
  fill(0);
  circle(width/2, height/2, lerpedY*500);
  noStroke();
}

////////////////////////////////////////
void update()
{
  // Rules
  // Alive: 2-3 - Survives, otherwise dies
  // Dead: 3 - Comes to life otherwise stays dead
println(lerpedY*500);


////////////////////////// horizontal

    if (horizontal==1){
    if ((lerpedY*500>=10)&&(lerpedY*500>=15)){
   for (int row = 0; row < size; row ++){
    board[row][224]=true;}}
    
    if ((lerpedY*500>=20)&&(lerpedY*500>=30)){
   for (int row = 0; row < size; row ++){
    board[row][244]=true;
    board[row][204]=true;}}
    
    if ((lerpedY*500>35)&&(lerpedY*500>=45)){
   for (int row = 0; row < size; row ++){
    board[row][264]=true;
    board[row][184]=true;}}
    
      if ((lerpedY*500>=50)&&(lerpedY*500>=60)){
   for (int row = 0; row < size; row ++){
    board[row][284]=true;
    board[row][164]=true;}}
    
    if ((lerpedY*500>=65)&&(lerpedY*500>=75)){
   for (int row = 0; row < size; row ++){
    board[row][304]=true;
    board[row][144]=true;}}
    
    if ((lerpedY*500>80)&&(lerpedY*500>=90)){
   for (int row = 0; row < size; row ++){
    board[row][324]=true;
    board[row][124]=true;}}
    
    if ((lerpedY*500>95)&&(lerpedY*500>=105)){
   for (int row = 0; row < size; row ++){
    board[row][344]=true;
    board[row][104]=true;}}
    
    if ((lerpedY*500>110)&&(lerpedY*500>=120)){
   for (int row = 0; row < size; row ++){
    board[row][364]=true;
    board[row][84]=true;}}
    
     if ((lerpedY*500>125)&&(lerpedY*500>=135)){
   for (int row = 0; row < size; row ++){
    board[row][384]=true;
    board[row][64]=true;}}
    
    if ((lerpedY*500>140)&&(lerpedY*500>=150)){
   for (int row = 0; row < size; row ++){
    board[row][404]=true;
    board[row][44]=true;}}
    
}
    ///////////////////////////////////////////sideways bars
    
     if(sideways==1){
    if ((lerpedY*500>=10)&&(lerpedY*500>=15)){
   for (int col = 0; col < size; col ++){
    board[224][col]=true;}}
    
    if ((lerpedY*500>=20)&&(lerpedY*500>=30)){
   for (int col = 0;col < size; col ++){
    board[244][col]=true;
    board[204][col]=true;}}
    
    if ((lerpedY*500>35)&&(lerpedY*500>=45)){
   for (int col = 0; col < size; col ++){
    board[264][col]=true;
    board[184][col]=true;}}
    
      if ((lerpedY*500>=50)&&(lerpedY*500>=60)){
   for (int col = 0; col < size; col ++){
    board[284][col]=true;
    board[164][col]=true;}}
    
    if ((lerpedY*500>=65)&&(lerpedY*500>=75)){
   for (int col = 0; col < size; col ++){
    board[304][col]=true;
    board[144][col]=true;}}
    
    if ((lerpedY*500>80)&&(lerpedY*500>=90)){
   for (int col = 0; col < size;col ++){
    board[324][col]=true;
    board[124][col]=true;}}
    
    if ((lerpedY*500>95)&&(lerpedY*500>=105)){
   for (int col = 0; col < size; col ++){
    board[344][col]=true;
    board[104][col]=true;}}
    
    if ((lerpedY*500>110)&&(lerpedY*500>=120)){
   for (int col = 0;col < size; col ++){
    board[364][col]=true;
    board[84][col]=true;}}
    
     if ((lerpedY*500>125)&&(lerpedY*500>=135)){
   for (int col = 0; col < size; col ++){
    board[384][col]=true;
    board[64][col]=true;}}
    
    if ((lerpedY*500>140)&&(lerpedY*500>=150)){
   for (int col = 0; col < size; col ++){
    board[404][col]=true;
    board[44][col]=true;}}
    
}
    
    ///////////////////////////////////////////
    ////////////////////////invert color
    
  int passedTime = millis() - savedTime;
  println(passedTime);
  
  if((passedTime>=11700)&&(passedTime<=13000)){
     C1= 255;
      C2=0;}
      
      if((passedTime>=24100)&&(passedTime<=27000)){
     C1= 0;
      C2=255;
    sideways=1;
  horizontal=0;}
  
     if((passedTime>=49000)&&(passedTime<=49900)){
     C1= 255;
      C2=0;
    sideways=0;
  horizontal=1;}
    
    
    
 /*   if (inv == false){
      C1= 0;
      C2=255;
    }
    if (inv == true){
      C1= 255;
      C2=0;
    }*/
    ////////////////////////
    

  for (int row = 0; row < size; row ++)
  {
    for (int col = 0; col < size; col ++)
    {
      float p;
      p = countLiveCellsAround(row, col);



      if (board[row][col]==true)
      {
        if (p<2)
        {
          next[row][col]=false;
        }
        if ((p>=2)&&(p<=3))
        {
          next[row][col]=true;
        }
        if (p>3)
        {
          next[row][col]=false;
        }
      }
      if (board[row][col]==false)
      {
        if (p==3)
        {
          next[row][col]=true;
        }
        if (p>3)
        {
          next[row][col]=false;
        }
        if (p<3)
        {
          next[row][col]=false;
        }
      }
    }
  }

  boolean[][] temp;
  temp = board;
  board = next;
  next = temp;
}

int countLiveCellsAround(int row, int col)
{
  int count = 0;
  for (int r = row -1; r <= row+1; r++)
  {
    for (int c = col - 1; c <= col + 1; c ++)
    {
      if (! (c == col && r == row))
      {
        if (isAlive(r, c))
        {
          count ++;
        }
      }
    }
  }

  return count;
}

void drawBoard()
{
  background(0);
  for (int row = 0; row < size; row ++)
  {
    for (int col = 0; col < size; col ++)
    {
      if (board[row][col])
      {
        fill(255);
      } else
      {
        noFill();
      }
      float x = map(col, 0, size, 0, width);
      float y = map(row, 0, size, 0, height);
      rect(x, y, cellSize, cellSize);
    }
  }
}

void drawBoard2()
{
  background(C1);
  for (int row = 0; row < size; row ++)
  {
    for (int col = 0; col < size; col ++)
    {
      if (board[row][col])
      {
        fill(C2);
      } else
      {
        noFill();
      }
      float x = map(col, 0, size, 0, width);
      float y = map(row, 0, size, 0, height);
      rect(x, y, cellSize, cellSize);
    }
  }
}

/*void randomise()
{
  for (int row = 0; row < size; row ++)
  {
    board[row][200]=true;
    board[row][300]=true;
  }
   for (int col = 0; col < size; col ++)
  {
    board[0][col]=true;
    board[449][col]=true;
  }
  for (int col = 0; col < size; col ++)
  {
    board[100][col]=true;
    board[349][col]=true;
  }
for (int col = 0; col < 200; col ++)
  {
for (int row = 0; row < 200; row ++)
  {
    float r = random(1.0f);
    if (r<0.5f){
       board[row][col]=true;}
  }
  
 }
}*/

boolean[][] board;
boolean[][] next;
int size = 450;
float cellSize;
