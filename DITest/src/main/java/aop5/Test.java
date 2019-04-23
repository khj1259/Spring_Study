package aop5;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Test {
	public static void main(String[] args) {
		ApplicationContext context = new GenericXmlApplicationContext("aop5/applicationContext.xml");
		
		IPerson boy = context.getBean("boy", IPerson.class); // 부모타입으로 받지 않으면 위빙이 안됨
		try {
			boy.doSomething();
		} catch (Exception e) {
		}
	}
}
