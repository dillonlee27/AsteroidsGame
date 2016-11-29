class Bullet extends Floater
{
	public Bullet(SpaceShip xWing)
	{
		myCenterX = xWing.getX();
		myCenterY = xWing.getY();
	}
}