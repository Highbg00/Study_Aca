public class Circle {
	private double radius;
	public Circle(double radius) {
		this.radius = radius;
	}
	
	public double getRadius() {
		return radius;
	}
	
	final double PI = 3.14;
	
	public double getArea() {
		return PI * radius * radius;
	}
}
