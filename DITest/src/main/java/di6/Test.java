package di6;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

/**
 * di3(설정자) => di6 복붙
 *
 */
public class Test {
	public static void main(String[] args) {
//		Tire t = new KoreaTire();
//		Tire t = new ChinaTire();
//		Car c = new Car();
//		c.setTire(t); // 사용할 타이어 주입, setter 주입을 더 많이 사용한다
//		c.drive();
		
//		객체를 만들거나 setter메서드로 주입시키는 작업은
//		스프링컨테이너에서 모두 진행 완료
		ApplicationContext context = new GenericXmlApplicationContext("di6/applicationContext.xml");
		Car c = context.getBean("car", Car.class);
		c.drive();
		
	}// end main
}// end class
