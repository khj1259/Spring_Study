package di7;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
/**
 * di1 => di7 복붙
 *
 */
public class Test {
	public static void main(String[] args) {
//		Car c = new Car();
//		c.drive();
		
		ApplicationContext context = new GenericXmlApplicationContext("di7/applicationContext.xml");
		Car c = context.getBean("c", Car.class);
		c.drive();
		((GenericXmlApplicationContext)context).close(); // 컨테이너 닫기
	}// end main
}// end class
