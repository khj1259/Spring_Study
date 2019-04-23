package di4;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

/**
 * di1 => di4 복붙
 *
 */
public class Test {
	public static void main(String[] args) {
//		xml 설정파일을 작성
//		자바코드에서 xml 설정파일을 매개로 해서
//		ApplicationContext 객체를 생성
//		컨테이너 객체로부터 bean 객체를 얻어다 쓰기
		
//		Car c = new Car(); // 객체생성을 스프링이 대신 해준다
		ApplicationContext context = new GenericXmlApplicationContext("di4/applicationContext.xml");
//		Car c = (Car) context.getBean("c"); // 변수명을 통해서 객체를 얻어옴, 직접 형변환 하는 벙법
		
		Car c = context.getBean("c", Car.class); // 지정한 클래스 정보를 함께 넘겨줌, 
		c.drive();
		
		Car c2 = context.getBean("c", Car.class); // 지정한 클래스 정보를 함께 넘겨줌, 
		c2.drive();
		
		System.out.println(c);
		System.out.println(c2);
		System.out.println(c == c2); // 주소가 같은가? true (하나의 객체다)
	}// end main
}// end class
// 스프링 컨테이너의 기존 객체관리 정책
// 컨테이너 생성시 자신이 포함할 빈 객체를 모두 생성
// 컨테이너 제거될 때 관리하는 빈 객체를 모두 제거하고 죽음

/*
 * BeanFactory : 객체 생성과 검색에 대한 기능을 정의, 싱글톤/프로토타입의 빈인지 여부를 확인하는 기능
 * |
 * ApplicationContext : 메시지, 이벤트, 환경변수 처리 기능
 * |
 * GenericXmlApplicationContext, AnnotationConfigApplicationContext, GenericGroovyApplicationContext
 * xml 로 부터 설정정보를 가져옴, 		 자바 어노테이션을 이용해 클래스로부터 정보 가져옴, 	 그루비 코드를 이용해서 정보 가져옴
 * 
 */

