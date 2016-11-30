class Bullet extends Floater
{
	public Bullet(SpaceShip xWing)
	{
		myCenterX = xWing.getX();
		myCenterY = xWing.getY();
		myPointDirection = xWing.getPointDirection();
		double dRadians =myPointDirection*(Math.PI/180);
		myDirectionX = 5 * Math.cos(dRadians) + xWing.getDirectionX();
		myDirectionY = 5 * Math.sin(dRadians) + xWing.getDirectionY();
	}
	public void show()
	{
		noStroke();
		fill(0,204,0);
		ellipse((int)myCenterX,(int)myCenterY,7.5,7.5);
	}
	public void move()
	{
		myCenterX += myDirectionX;
		myCenterY += myDirectionY;
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