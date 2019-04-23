package di8;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

/**
 * di2 => di8 복붙
 */
public class Test {
	public static void main(String[] args) {
//		Tire t = new ChinaTire();
//		Car c = new Car(t);
//		c.drive();
		ApplicationContext context = new GenericXmlApplicationContext("di8/applicationContext.xml");
		Car c = context.getBean("car", Car.class);
		c.drive();
		
	}// end main
}// end class

// 설정파일 생성 - applicationContext 로
// di8 패키지 파일들을 scan 하고싶다. namespace에서 추가, 설정파일에도 선언
// Car 클래스에서 scan 대상이 될 수 있도록 선언