package di2;

public class Test {
	public static void main(String[] args) {
//		Tire t = new KoreaTire();
		Tire t = new ChinaTire();
		Car c = new Car(t);
		c.drive();
	}// end main
}// end class

// 소스코드의 의존성이 들어가는 코드를 모두 제거하고, 
// 의존성이 꼭 들어가야하는 코드는 한곳에 몰아 놓음 (스프링 컨테이너)
// IoC (제어의 역전)
