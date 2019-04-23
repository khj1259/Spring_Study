package di9;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

/**
 * di3 => di9 복붙
 */
public class Test {
	public static void main(String[] args) {
//		Tire t = new ChinaTire();
//		Car c = new Car();
//		c.setTire(t); // 사용할 타이어 주입, setter 주입을 더 많이 사용한다
//		c.drive();
		
		ApplicationContext context = new GenericXmlApplicationContext("di9/applicationContext.xml");
		Car c = context.getBean("car", Car.class);
		c.drive();
		
	}// end main
}// end class

// 소스코드의 의존성이 들어가는 코드를 모두 제거하고, 
// 의존성이 꼭 들어가야하는 코드는 한곳에 몰아 놓음 (스프링 컨테이너)
// IoC (제어의 역전)
