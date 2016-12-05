SpaceShip xWing = new SpaceShip();
Star[] blackOut = new Star[200];
ArrayList <Asteroids> floatingRock;
ArrayList <Bullet> gun;
int x = 0;
public void setup() 
{
  size(800,800);
  for (int i = 0; i < blackOut.length; i++)
  {
    blackOut[i] = new Star();
  }
  floatingRock = new ArrayList <Asteroids>();
  for (int n =0; n < 25; n++)
  {
    floatingRock.add(new Asteroids());
  }
  gun = new ArrayList <Bullet>();
}

public void draw() 
{
  background(0);
  xWing.show();
  xWing.move();
  for (int i =0; i < blackOut.length; i++)
  {
    blackOut[i].show();
  }
  for (int n = 0; n < floatingRock.size(); n++)
  {
    floatingRock.get(n).show();
    floatingRock.get(n).move();
  }
  for (int g = 0; g < gun.size(); g++)
  {
    gun.get(g).show();
    gun.get(g).move();
  }
  for (int t = 0; t < floatingRock.size(); t++)
  {
    for (int p = 0; p < gun.size(); p++)
    {
      if(dist(floatingRock.get(t).getX(), floatingRock.get(t).getY(), xWing.getX(), xWing.getY()) < 20)
      {
        floatingRock.remove(t);
      }
      if (dist(gun.get(p).getX(), gun.get(p).getY(), floatingRock.get(t).getX(), floatingRock.get(t).getY()) < 20)
      {
        floatingRock.remove(t);
        gun.remove(p);
      }
    }
  }
  //for (int p = 0; p < gun.size(); p++)
  // {
  //   if(dist(gun.get(p).getX(), gun.get(p).getY(), floatingRock.get(p).getX(), floatingRock.get(p).getY()) < 20)
  //   {
  //     floatingRock.remove(p);
  //     gun.remove(p);
  //   }
  // }  
}
public void keyPressed()
{
  if (key == 'v') //hyperspace
  {
    xWing.setX((int)(Math.random()*1000));
    xWing.setY((int)(Math.random()*1000));
    xWing.setPointDirection((int)(Math.random()*360));
    xWing.myDirectionX = 0;
    xWing.myDirectionY = 0;
  }
  if (key == 'w') //accelerate forward
  {
    xWing.accelerate(0.1);
  }
  if (key == 's') //backwards
  {
    xWing.accelerate(-0.1);
  }
  if (key == 'a') //rotate left
  {
    xWing.rotate(x-15);
  }
  if (key == 'd') //rotate right
  {
    xWing.rotate(x+15);
  }
  if (key == ' ')
  {
    gun.add(new Bullet(xWing));
  }
}


 public void keyReleased()
 {
   if (key == 's')
   {
     xWing.myDirectionX = 0;
     xWing.myDirectionY = 0;
   }
 }

class SpaceShip extends Floater 
{
  public SpaceShip()
  {
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -8;
    yCorners[0] = -8;
    xCorners[1] = 16;
    yCorners[1] = 0;
    xCorners[2] = -8;
    yCorners[2] = 8;
    xCorners[3] = -2;
    yCorners[3] = 0;
    myColor = color(0,204,0);
    myCenterX = 400;
    myCenterY = 400;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 270;
  }
  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;}
  public void setY(int y) {myCenterY = y;}
  public int getY() {return (int)myCenterY;}
  public void setDirectionX(double x) {myDirectionX = x;}
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}
}


class Asteroids extends Floater
{
  private int rotSpeed;
  public Asteroids()
  {
    corners = 6;
    xCorners = new int [corners];
    yCorners = new int [corners];
    xCorners[0] = -11;
    yCorners[0] = -8;
    xCorners[1] = 7;
    yCorners[1] = -8;
    xCorners[2] = 13;
    yCorners[2] = 0;
    xCorners[3] = 6;
    yCorners[3] = 10;
    xCorners[4] = -11;
    yCorners[4] = 8;
    xCorners[5] = -5;
    yCorners[5] = 0;
    myColor = color(160,160,160);
    myCenterX = Math.random()*800;
    myCenterY = Math.random()*800;
    myDirectionX = Math.random()*2-1;
    myDirectionY = Math.random()*2-1;
    myPointDirection = 0;
    rotSpeed = (int)(Math.random()*3);
  }
  public void move()
  {
    rotate(rotSpeed);
    super.move();
  }
  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;}
  public void setY(int y) {myCenterY = y;}
  public int getY() {return (int)myCenterY;}
  public void setDirectionX(double x) {myDirectionX = x;}
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}
}


class Star 
{
  private int myX;
  private int myY;
  //private int starColor;
  Star()
  {
    myX = (int)(Math.random()*1000);
    myY = (int)(Math.random()*1000);
    //starColor = color(255,255,255);
  }
  public void show()
  {
    stroke(255,255,255);
    fill(255,255,255);
    ellipse(myX,myY,2.5,2.5);
  }
}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

