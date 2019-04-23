package diz10;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

/**
 * di9 설정자 주입 => diz10 복붙 (z는 순서때문에)
 * 객체관리를 받을 클래스들을 지정
 * xml	-	applicationContext.xml 에서 지정(<bean>, <context:component-scan>+@Component 클래스에)
 * java	-	ApplicationConfig.java 에서 지정
 */
public class Test {
	public static void main(String[] args) {
//		ApplicationContext context = new GenericXmlApplicationContext("di10/applicationContext.xml");
//		Car c = context.getBean("car", Car.class);
//		c.drive();
		ApplicationContext context = new AnnotationConfigApplicationContext(ApplicationConfig.class);
		// 자바 설정파일에서 설정정보를 읽어오기, 각 객체는 싱글톤 정책을 같이 사용한다(여러개 생성해도 주소 같음)
//		KoreaTire tire = context.getBean("koreaTire", KoreaTire.class);
//		System.out.println(tire.getName());
		
		Car c = context.getBean("car", Car.class);
		c.drive();
	}// end main
}// end class

/*
 * BeanFactory : 객체 생성과 검색에 대한 기능을 정의, 싱글톤/프로토타입의 빈인지 여부를 확인하는 기능
 * |
 * ApplicationContext : 메시지, 이벤트, 환경변수 처리 기능
 * |
 * GenericXmlApplicationContext, AnnotationConfigApplicationContext, GenericGroovyApplicationContext
 * xml 로 부터 설정정보를 가져옴, 		 자바 어노테이션을 이용해 클래스로부터 정보 가져옴, 	 그루비 코드를 이용해서 정보 가져옴
 * 
 */