package di4_1;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

/**
 * di4 => di4_1 복붙
 * 초기화 / 소멸 메서드를 지정
 */
public class Test {
	public static void main(String[] args) {
//		Car c = new Car(); // 객체생성을 스프링이 대신 해준다
		ApplicationContext context = new GenericXmlApplicationContext("di4_1/applicationContext.xml");
//		Car c = (Car) context.getBean("c"); // 변수명을 통해서 객체를 얻어옴, 직접 형변환 하는 벙법
		Car c = context.getBean("c", Car.class); // 지정한 클래스 정보를 함께 넘겨줌, 
		c.drive();
		
		Car c2 = context.getBean("c", Car.class); // 지정한 클래스 정보를 함께 넘겨줌, 
		c2.drive();
		
		System.out.println(c);
		System.out.println(c2);
		System.out.println(c == c2); // 주소가 같은가? true (하나의 객체다)
		
		// 컨테이너를 닫으면, 빈 객체가 소멸한다
		((GenericXmlApplicationContext)context).close(); // 컨테이너 닫기
//		ApplicationContext 인터페이스에는 닫는 메서드를 선언하지 않음
//		GenericXmlApplicationContext 클래스에 닫는 메서드를 선언해 놓음 -> 닫으려면 저걸로 형변환해서 닫아야 함
		
	}// end main
}// end class

